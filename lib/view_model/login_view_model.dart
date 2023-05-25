import 'package:flutter/material.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/model/user.dart';
import 'package:vet_student/repository/auth_repository.dart';
import 'package:vet_student/tools/routes.dart';

import '../tools/locator.dart';

enum LoginViewState { idle, loading }

class LoginViewModel with ChangeNotifier {
  LoginViewState _state = LoginViewState.idle;
  final AuthRepository _authRepository = locator<AuthRepository>();

  LoginViewState get state => _state;

  set state(LoginViewState value) {
    _state = value;
    notifyListeners();
  }

  void signInWithEmailAndPassword(
    BuildContext context,
    String eMail,
    String password,
  ) async {
    User? user = await _authRepository.signInWithEmailAndPassword(
      eMail,
      password,
    );
    if (user != null && user.userId != null) {
      //CMessagingSettings.init(context, user.userId!);
      openMainPage(context);
    } else {
      SnackBar snackBar = SnackBar(
        content: Text(S.of(context).loginFailed),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void openMainPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.mainPageKey);
  }

  void openRegisterPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.registerPageKey);
  }

  void signInWithGoogle() async {
    User? user = await _authRepository.signInWithGoogle();
  }
}
