import 'package:flutter/material.dart';
import 'package:vet_student/tools/routes.dart';

class ProfileDetailViewModel with ChangeNotifier {

  void onBackPressed(BuildContext context){
    Navigator.pop(context);
  }

  void openHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.homePageKey);
  }
}
