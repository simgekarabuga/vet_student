import 'package:flutter/material.dart';
import 'package:vet_student/tools/routes.dart';

class ProfileEditViewModel with ChangeNotifier {
  void openSettingsPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.settingsPageKey);
  }
  }
