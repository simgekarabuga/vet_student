import 'dart:io';

abstract class StorageDatabaseBase {
  Future<String?> uploadUserImage(File file, String folderName);
}
