import 'package:vet_student/model/user.dart';

abstract class UserDatabaseBase {
  Future<void> addUser(User user);

  Future<void> updateUser(String userId, Map<String, dynamic> newValues);

  Future<User?> getCurrentUser();
}
