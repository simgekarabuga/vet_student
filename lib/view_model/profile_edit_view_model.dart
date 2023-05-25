import 'package:flutter/material.dart';
import 'package:vet_student/model/user.dart';
import 'package:vet_student/repository/auth_repository.dart';
import 'package:vet_student/repository/user_database_repository.dart';
import 'package:vet_student/tools/locator.dart';

class ProfileEditViewModel with ChangeNotifier {
  final AuthRepository _authRepository = locator<AuthRepository>();
  final UserDatabaseRepository _userDatabaseRepository =
      locator<UserDatabaseRepository>();

  User? user;

  ProfileEditViewModel() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _getCurrentUser();
      },
    );
  }

  void _getCurrentUser() async {
    user = await _userDatabaseRepository.getCurrentUser();
    notifyListeners();
  }

  void onBackPressed(BuildContext context) {
    Navigator.pop(context);
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
}
