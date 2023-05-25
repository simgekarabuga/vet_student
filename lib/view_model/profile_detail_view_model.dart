import 'package:flutter/material.dart';
import 'package:vet_student/tools/routes.dart';

class ProfileDetailViewModel with ChangeNotifier {
  void openHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.homePageKey);
  }
}
