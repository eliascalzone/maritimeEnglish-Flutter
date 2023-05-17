import 'package:flutter/material.dart';
import 'views/homepage.dart';
import 'views/settingspage.dart';
import '../data/allwordslist.dart';

class Model {
  bool isDarkModeEnable = false;

  bool get darkMode => isDarkModeEnable;

  void enableDarkMode(bool dm) {
    isDarkModeEnable = dm;
  }

  List<Widget> pages = const [Homepage(), Settings()];

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void changePage(int newPage) {
    _currentPage = newPage;
  }
}
