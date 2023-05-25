import 'package:get_it/get_it.dart';
import 'package:vet_student/repository/preferences_repository.dart';
import 'package:vet_student/repository/storage_database_repository.dart';
import 'package:vet_student/repository/user_database_repository.dart';
import 'package:vet_student/service/firebase/firebase_auth_service.dart';
import 'package:vet_student/service/firebase/firebase_storage_database_service.dart';
import 'package:vet_student/service/firebase/firebase_user_database_service.dart';
import 'package:vet_student/service/shared_preferences_service.dart';
import 'package:vet_student/repository/auth_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => PreferencesRepository());

  locator.registerLazySingleton(() => SharedPreferencesService());

  locator.registerLazySingleton(() => UserDatabaseRepository());
  locator.registerLazySingleton(() => FirebaseUserDatabaseService());
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerLazySingleton(() => FirebaseAuthService());

  locator.registerLazySingleton(() => StorageDatabaseRepository());
  locator.registerLazySingleton(() => FirebaseStorageDatabaseService());
}
