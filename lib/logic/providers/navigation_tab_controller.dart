import 'package:flutter/material.dart';

class NavigationTabController extends ChangeNotifier {
  /// represents current tab index
  var _index = 0;

  NavigationTabController({int initialIndex = 0}) : _index = initialIndex;

  /// public getter for current tab index
  int get index => _index;

  void jumpToTab(int _newValue) {
    if (_index == _newValue) {
      return;
    }
    _index = _newValue;
    notifyListeners();
  }

  bool isActive(int currentIndex) => currentIndex == _index;
}
