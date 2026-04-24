import 'package:flutter/foundation.dart';

class MainNavProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  Future<void> setIndex(int index) async {
    _selectedIndex = index;
    notifyListeners();
  }

  bool shouldCheckIfUserLoggedIn(int index) => index == 2 || index == 3;

  void backToHome() {
    setIndex(0);
  }

  void moveToCategory() {
    setIndex(1);
  }
}