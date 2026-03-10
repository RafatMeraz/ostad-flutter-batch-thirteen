import 'package:flutter/foundation.dart';

class MainNavProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void backToHome() {
    setIndex(0);
  }

  void moveToCategory() {
    setIndex(1);
  }
}