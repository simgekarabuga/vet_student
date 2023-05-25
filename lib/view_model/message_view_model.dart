import 'package:flutter/material.dart';
import 'package:vet_student/tools/routes.dart';

enum MessageViewState { idle, loading }

class MessageViewModel with ChangeNotifier {
  MessageViewState _state = MessageViewState.idle;

  MessageViewState get state => _state;

  set state(MessageViewState value) {
    _state = value;
    notifyListeners();
  }

  void openMainPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.mainPageKey);
  }


}
