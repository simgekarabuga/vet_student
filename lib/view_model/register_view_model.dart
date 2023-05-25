import 'package:flutter/material.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/model/user.dart';
import 'package:vet_student/repository/auth_repository.dart';
import 'package:vet_student/repository/user_database_repository.dart';
import 'package:vet_student/tools/locator.dart';
import 'package:vet_student/tools/routes.dart';

enum RegisterViewState { idle, loading }

class RegisterViewModel with ChangeNotifier {
  final AuthRepository _authRepository = locator<AuthRepository>();
  final UserDatabaseRepository _userDatabaseRepository =
      locator<UserDatabaseRepository>();

  bool _isTermsOfUseAccepted = false;

  bool get isTermsOfUseAccepted => _isTermsOfUseAccepted;

  set isTermsOfUseAccepted(bool value) {
    _isTermsOfUseAccepted = value;
    notifyListeners();
  }

  void signUpWithEmailAndPassword(
    BuildContext context,
    String eMail,
    String password,
    String fullName,
    String phone,
  ) async {
    if (_isTermsOfUseAccepted) {
      User? user = await _authRepository.signUpWithEmailAndPassword(
        eMail,
        password,
      );
      if (user != null) {
        user.fullName = fullName;
        user.phone = phone;
        await _userDatabaseRepository.addUser(user);
      } else {
        SnackBar snackBar = SnackBar(
          content: Text(S.of(context).loginFailed),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        openRegisterPage(context);
      }
    } else {
      SnackBar snackBar = SnackBar(
        content: Text(S.of(context).termsOfUsedError),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      openRegisterPage(context);
    }
  }

  void openMainPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.mainPageKey);
  }

  void openLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.loginPageKey);
  }

  void openRegisterPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.registerPageKey);
  }
}
