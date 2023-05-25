import 'package:flutter/material.dart';

enum SettingsPageViewState { idle, loading }

class SettingsPageViewModel with ChangeNotifier {
  SettingsPageViewState _state = SettingsPageViewState.idle;

  SettingsPageViewState get state => _state;

  set state(SettingsPageViewState value) {
    _state = value;
    notifyListeners();
  }
}
