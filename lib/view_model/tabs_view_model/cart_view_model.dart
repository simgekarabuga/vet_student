import 'package:flutter/material.dart';

enum CartViewState { idle, loading }

class CartViewModel with ChangeNotifier {
  CartViewState _state = CartViewState.idle;

  CartViewState get state => _state;

}