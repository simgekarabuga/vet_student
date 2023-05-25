import 'package:flutter/material.dart';
import 'package:vet_student/tools/routes.dart';



class ShoppingViewModel with ChangeNotifier {



  void onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }

  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  set currentTabIndex(int value) {
    _currentTabIndex = value;
    notifyListeners();
  }

}
