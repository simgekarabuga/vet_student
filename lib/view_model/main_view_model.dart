

import 'package:flutter/material.dart';
import 'package:vet_student/tools/routes.dart';

enum MainViewState { idle, loading }

class MainViewModel with ChangeNotifier {
  MainViewState _state = MainViewState.idle;

  MainViewState get state => _state;

  void openMessagePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.messagePageKey);
  }
  void openShoppingPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.shoppingPageKey);
  }



}
