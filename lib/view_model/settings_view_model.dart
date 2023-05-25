import 'package:flutter/material.dart';
import 'package:vet_student/repository/auth_repository.dart';
import 'package:vet_student/tools/locator.dart';
import 'package:vet_student/tools/routes.dart';

class SettingsViewModel with ChangeNotifier {
  final AuthRepository _authRepository = locator<AuthRepository>();

  void openProfilePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.profilePageKey);
  }
  void openProfileHeadersPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.profileEditPageKey);
  }
}