import 'package:flutter/material.dart';

class TestProvider extends ChangeNotifier {
  String _currentTime = '';

  String get currentTime => _currentTime;

  void getCurrentDateTime() {
    _currentTime = DateTime.now().toString();
    notifyListeners();
  }
}
