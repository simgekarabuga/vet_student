import 'package:vet_student/base/user_database_base.dart';
import 'package:vet_student/model/user.dart';
import 'package:vet_student/service/base/user_database_service.dart';
import 'package:vet_student/service/firebase/firebase_user_database_service.dart';
import 'package:vet_student/tools/locator.dart';

class UserDatabaseRepository implements UserDatabaseBase {
  final UserDatabaseService _service = locator<FirebaseUserDatabaseService>();

  @override
  Future<void> addUser(User user) async {
    return await _service.addUser(user);
  }

  @override
  Future<void> updateUser(String userId, Map<String, dynamic> newValues) async {
    return await _service.updateUser(userId, newValues);
  }

  @override
  Future<User?> getCurrentUser() async {
    return await _service.getCurrentUser();
  }
}
