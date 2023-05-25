import 'package:vet_student/model/user.dart';

abstract class AuthBase {
  Future<User?> signUpWithEmailAndPassword(
    String eMail,
    String password,
  );

  Future<User?> signInWithEmailAndPassword(
    String eMail,
    String password,
  );
  String? getCurrentUserId();
  Future<User?> signInWithGoogle();
}
