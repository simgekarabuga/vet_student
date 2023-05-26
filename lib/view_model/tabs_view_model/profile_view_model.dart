import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/model/user.dart';
import 'package:vet_student/repository/auth_repository.dart';
import 'package:vet_student/repository/storage_database_repository.dart';
import 'package:vet_student/repository/user_database_repository.dart';
import 'package:vet_student/tools/locator.dart';
import 'package:vet_student/tools/routes.dart';

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
    ImageSource source,
  ) async {
    try {
      String? userId = await _authRepository.getCurrentUserId();

      if (userId != null) {
        XFile? pickedImage = await ImagePicker().pickImage(source: source);
        if (pickedImage != null) {
          File imageFile = File(pickedImage.path);

          if (imageType == ImageType.profile) {
            profileImage = imageFile;
          }
          if (imageType == ImageType.background) {
            backgroundImage = imageFile;
          }
          if (imageType == ImageType.special) {
            specialImage = imageFile;
          }

          String? imageUrl =
              await _storageDatabaseRepository.uploadProfilePhoto(imageFile);
          if (imageUrl != null) {
            Map<String, dynamic> newValues = {};

            if (imageType == ImageType.profile) {
              newValues[User.imageUrlKey] = imageUrl;
            }
            if (imageType == ImageType.background) {
              newValues[User.backgroundImageUrlKey] = imageUrl;
            }
            if (imageType == ImageType.special) {}

            _userDatabaseRepository.updateUser(
              userId,
              newValues,
            );
            user = await _userDatabaseRepository.getCurrentUser();
            notifyListeners();
          }
        }
      }
    } catch (e) {
      print("${S.of(context).failedImage} :$e");
    }
  }
}
