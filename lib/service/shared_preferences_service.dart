import 'package:shared_preferences/shared_preferences.dart';
import 'package:vet_student/service/base/preferences_service.dart';

class SharedPreferencesService implements PreferencesService {
  final String _onboardingCompletedKey = "onboarding_completed";

  SharedPreferences? _prefs;

  Future<void> initSharedPreferences() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  @override
  Future<bool> getOnboardingCompleted() async {
    await initSharedPreferences();
    return _prefs?.getBool(_onboardingCompletedKey) ?? false;
  }

  @override
  Future<bool> setOnboardingCompleted(bool completed) async {
    await initSharedPreferences();
    return await _prefs?.setBool(_onboardingCompletedKey, completed) ?? false;
  }
}
