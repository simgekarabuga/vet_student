import 'package:flutter/material.dart';



class ShoppingViewModel with ChangeNotifier {





  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  set currentTabIndex(int value) {
    _currentTabIndex = value;
    notifyListeners();
  }

}
