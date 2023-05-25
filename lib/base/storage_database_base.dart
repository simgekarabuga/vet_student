import 'dart:io';

abstract class StorageDatabaseBase {
  Future<String?> uploadProfilePhoto(File file);
}
