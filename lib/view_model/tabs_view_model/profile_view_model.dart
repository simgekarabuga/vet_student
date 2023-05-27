import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/model/user.dart';
import 'package:vet_student/repository/auth_repository.dart';
import 'package:vet_student/repository/storage_database_repository.dart';
import 'package:vet_student/repository/user_database_repository.dart';
import 'package:vet_student/tools/locator.dart';
import 'package:vet_student/tools/routes.dart';
import 'package:vet_student/view/common/photo_picker.dart';

enum ImageType { profile, background, special }

class ProfileViewModel with ChangeNotifier {
  final AuthRepository _authRepository = locator<AuthRepository>();
  final UserDatabaseRepository _userDatabaseRepository =
      locator<UserDatabaseRepository>();
  final StorageDatabaseRepository _storageDatabaseRepository =
      locator<StorageDatabaseRepository>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  User? user;

  File? profileImage;
  File? backgroundImage;
  File? specialImage;

  ProfileViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentUser();
    });
  }

  void _getCurrentUser() async {
    user = await _userDatabaseRepository.getCurrentUser();
    notifyListeners();
  }

  void updateProfile(String fullName, String description) {
    String? userId = user?.userId;
    if (user != null && userId != null) {
      Map<String, dynamic> newValues = {};
      if (fullName != user!.fullName) {
        newValues[User.fullNameKey] = fullName;
      }
      if (description != user!.description) {
        newValues[User.descriptionKey] = description;
      }

      if (newValues.isNotEmpty) {
        _userDatabaseRepository.updateUser(userId, newValues);
      }
    }
  }

  void openSettingsPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.settingsPageKey);
  }

  void getCurrentUser() async {
    User? user = await _userDatabaseRepository.getCurrentUser();
    if (user != null) {
      fullNameController.text = user.fullName;
      phoneController.text = user.phone;
      descriptionController.text = user.description;

      notifyListeners();
    }
  }

  void addImage(
    BuildContext context,
    ImageType imageType,
  ) async {
    try {
      String? userId = _authRepository.getCurrentUserId();

      if (userId != null && user != null) {
        int photoCount = user!.specialImageUrls.length;

        if (photoCount < 5) {
          File? imageFile = await PhotoPicker(
            takePhotoText: S.of(context).takePhoto,
            chooseFromGalleryText: S.of(context).chooseFromGallery,
            cancelText: S.of(context).cancel,
            cropImage: true,
            aspectRatio: imageType == ImageType.background ? 3.0 : 1.0,
          ).pick(context);

          if (imageFile != null) {
            String folderName = '';

            if (imageType == ImageType.profile) {
              profileImage = imageFile;
              folderName = 'profile_photos';
            }
            if (imageType == ImageType.background) {
              backgroundImage = imageFile;
              folderName = 'background_images';
            }
            if (imageType == ImageType.special) {
              specialImage = imageFile;
              folderName = 'special_images';
            }

            String? imageUrl = await _storageDatabaseRepository.uploadUserImage(
              imageFile,
              folderName,
            );

            if (imageUrl != null) {
              Map<String, dynamic> newValues = {};

              if (imageType == ImageType.profile) {
                newValues[User.imageUrlKey] = imageUrl;
              }
              if (imageType == ImageType.background) {
                newValues[User.backgroundImageUrlKey] = imageUrl;
              }
              if (imageType == ImageType.special) {
                newValues[User.specialImageUrlsKey] = imageUrl;
              }

              _userDatabaseRepository.updateUser(
                userId,
                newValues,
              );
              user = await _userDatabaseRepository.getCurrentUser();
              notifyListeners();
            }
          }
        } else {
          // TODO: Uyarı göster
        }
      }
    } catch (e) {
      print("${S.of(context).failedImage} :$e");
    }
  }
}
