import 'package:flutter/material.dart';
import 'package:vet_student/repository/auth_repository.dart';
import 'package:vet_student/tools/locator.dart';
import 'package:vet_student/tools/routes.dart';

class SplashViewModel with ChangeNotifier {
  final AuthRepository _authRepository = locator<AuthRepository>();

  void checkIsAlreadySignedIn(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String? currentUserId = _authRepository.getCurrentUserId();
      if (currentUserId != null) {
        //CMessagingSettings.init(context, currentUserId);
        _openMainPage(context);
      } else {
        _openLoginPage(context);
      }
    });
  }

  void _openLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.loginPageKey);
  }

  void _openMainPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.mainPageKey);
  }
}
