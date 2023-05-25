import 'package:google_sign_in/google_sign_in.dart';
import 'package:vet_student/model/user.dart';
import 'package:vet_student/service/base/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirebaseAuthService implements AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  String? _currentUserId;

  @override
  Future<User?> signUpWithEmailAndPassword(
    String eMail,
    String password,
  ) async {
    auth.UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: eMail,
      password: password,
    );
    auth.User? firebaseUser = credential.user;
    return _userFromFirebaseUser(firebaseUser);
  }

  User? _userFromFirebaseUser(auth.User? firebaseUser) {
    User? user;
    if (firebaseUser != null) {
      String? firebaseUserEmail = firebaseUser.email;
      if (firebaseUserEmail != null) {
        user = User(
          userId: firebaseUser.uid,
          eMail: firebaseUserEmail,
        );
      }
    }
    return user;
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      String eMail, String password) async {
    User? user;
    try {
      auth.UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: eMail,
        password: password,
      );
      auth.User? firebaseUser = credential.user;
      user = _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e);
    }
    return user;
  }

  @override
  String? getCurrentUserId() {
    _currentUserId ??= _auth.currentUser?.uid;
    return _currentUserId;
  }
  @override
  Future<User?> signInWithGoogle() async {
    User? user;

    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        //'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      auth.AuthCredential authCredential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      auth.UserCredential userCredential =
      await _auth.signInWithCredential(authCredential);
      auth.User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        user = _userFromFirebaseUser(firebaseUser);

      }
    }
    return user;
  }
}
