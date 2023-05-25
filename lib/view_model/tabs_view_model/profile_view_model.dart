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
  File? image;

  ProfileViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCurrentUser();
    });
  }

  void openSettingsPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.settingsPageKey);
  }

  void updateProfile(BuildContext context) async {
    String? currentUserId = _authRepository.getCurrentUserId();
    if (currentUserId != null) {
      Map<String, dynamic> newValues = {
        User.fullNameKey: fullNameController.text.trim(),
        User.phoneKey: phoneController.text.trim(),
        User.descriptionKey: phoneController.text.trim(),
      };
      await _userDatabaseRepository.updateUser(currentUserId, newValues);
    } else {
      SnackBar snackBar = SnackBar(
        content: Text(S.of(context).loginFailed),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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

  void addImageForSpecialPics(BuildContext context, ImageSource source) async {
    try {
      String? userId = await _authRepository.getCurrentUserId();
      print("UserId: " + (userId?? "null"));
      if (userId != null) {
        XFile? pickedImage = await ImagePicker().pickImage(source: source);
        if (pickedImage != null) {
          image = File(
            pickedImage.path,
          );
          if (image != null) {
            String? imageUrl =
                await _storageDatabaseRepository.uploadProfilePhoto(image!);
            if (imageUrl != null) {
              _userDatabaseRepository.updateUser(
                userId,
                {
                  User.imageUrlKey: imageUrl,
                },
              );
              User? user = await _userDatabaseRepository.getCurrentUser();
            }
          }
        }
      }
    } catch (e) {
      print("${S.of(context).failedImage} :$e");
    }
  }

  void addImage(BuildContext context, ImageSource source) async {
    try {
      String? userId = await _authRepository.getCurrentUserId();
      print(userId);
      if (userId != null) {
        XFile? pickedImage = await ImagePicker().pickImage(source: source);
        if (pickedImage != null) {
          image = File(
            pickedImage.path,
          );
          if (image != null) {
            String? imageUrl =
                await _storageDatabaseRepository.uploadProfilePhoto(image!);
            if (imageUrl != null) {
              _userDatabaseRepository.updateUser(
                userId,
                {
                  User.imageUrlKey: imageUrl,
                },
              );
              User? user = await _userDatabaseRepository.getCurrentUser();
            }
          }
        }
      }
    } catch (e) {
      print("${S.of(context).failedImage} :$e");
    }
  }
}
