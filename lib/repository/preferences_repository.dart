import 'package:vet_student/tools/locator.dart';
import 'package:vet_student/base/preferences_base.dart';
import 'package:vet_student/service/base/preferences_service.dart';
import 'package:vet_student/service/shared_preferences_service.dart';

class PreferencesRepository implements PreferencesBase {
  final PreferencesService _service = locator<SharedPreferencesService>();

  @override
  Future<bool> getOnboardingCompleted() async {
    return await _service.getOnboardingCompleted();
  }

  @override
  Future<bool> setOnboardingCompleted(bool completed) async {
    return await _service.setOnboardingCompleted(completed);
  }
}
