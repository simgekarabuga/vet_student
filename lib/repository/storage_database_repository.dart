import 'dart:io';

import 'package:vet_student/base/storage_database_base.dart';
import 'package:vet_student/service/base/storage_database_service.dart';
import 'package:vet_student/service/firebase/firebase_storage_database_service.dart';
import 'package:vet_student/tools/locator.dart';

class StorageDatabaseRepository implements StorageDatabaseBase {
  final StorageDatabaseService _service =
      locator<FirebaseStorageDatabaseService>();

  @override
  Future<String?> uploadUserImage(File file, String folderName) async {
    return await _service.uploadUserImage(file, folderName);
  }
}
