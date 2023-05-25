import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:vet_student/repository/auth_repository.dart';
import 'package:vet_student/service/base/storage_database_service.dart';
import 'package:vet_student/tools/locator.dart';

class FirebaseStorageDatabaseService implements StorageDatabaseService {
  final AuthRepository _authRepository = locator<AuthRepository>();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  File? image;

  @override
  Future<String?> uploadProfilePhoto(File file) async {
    String? userId = await _authRepository.getCurrentUserId();
    if (userId != null) {

      Reference reference = _storage.ref("users/$userId.jpg");
      UploadTask task = reference.putFile(file);

      try {
        TaskSnapshot snapshot = await task;
        return await snapshot.ref.getDownloadURL();
      } on FirebaseException catch (e) {
        print(e);
        return null;
      }
    }
  }
}