import 'package:flutter/material.dart';
import 'package:vet_student/tools/routes.dart';

class SettingsViewModel with ChangeNotifier {
  void onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void openProfileHeadersPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.profileEditPageKey);
  }
}
