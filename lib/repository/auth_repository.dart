import 'package:vet_student/base/auth_base.dart';
import 'package:vet_student/model/user.dart';
import 'package:vet_student/service/firebase/firebase_auth_service.dart';

import 'package:vet_student/tools/locator.dart';

class AuthRepository implements AuthBase {
  final FirebaseAuthService _service = locator<FirebaseAuthService>();

  @override
  Future<User?> signUpWithEmailAndPassword(
    String eMail,
    String password,
  ) async {
    return await _service.signUpWithEmailAndPassword(eMail, password);
  }

  @override
  Future<User?> signInWithEmailAndPassword(
    String eMail,
    String password,
  ) async {
    return await _service.signInWithEmailAndPassword(eMail, password);
  }

  @override
  String? getCurrentUserId() {
    return _service.getCurrentUserId();
  }

  @override
  Future<User?> signInWithGoogle()async {
    return await _service.signInWithGoogle();
  }
}
