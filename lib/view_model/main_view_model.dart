

import 'package:flutter/material.dart';
import 'package:vet_student/tools/routes.dart';

enum MainViewState { idle, loading }

class MainViewModel with ChangeNotifier {
  MainViewState _state = MainViewState.idle;

  MainViewState get state => _state;

  void openMessagePage(BuildContext context) {
    Navigator.pushNamed(context, Routes.messagePageKey);
  }
  void openShoppingPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.shoppingPageKey);
  }



}
