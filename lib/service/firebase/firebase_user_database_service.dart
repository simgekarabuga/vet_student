import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_student/model/user.dart';
import 'package:vet_student/repository/auth_repository.dart';
import 'package:vet_student/service/base/user_database_service.dart';
import 'package:vet_student/tools/locator.dart';

class FirebaseUserDatabaseService implements UserDatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthRepository _authRepository = locator<AuthRepository>();

  @override
  Future<void> addUser(User user) async {
    _firestore.collection("users").doc(user.userId).set(user.toMap());
  }

  @override
  Future<void> updateUser(String userId, Map<String, dynamic> newValues) async {
    _firestore.collection("users").doc(userId).update(newValues);
  }

  @override
  Future<User?> getCurrentUser() async {
    String? userId = _authRepository.getCurrentUserId();
    if (userId != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection("users").doc(userId).get();
      Map<String, dynamic>? userMap = snapshot.data();
      if (userMap != null) {
        User user = User.fromMap(userId, userMap);
        return user;
      }
    }
    return null;
  }
}
