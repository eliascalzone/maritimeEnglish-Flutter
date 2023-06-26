class NavigationModel {
  int _currentScreen = 0;

  int get currentScreen => _currentScreen;

  void changeScreen(int newScreen) {
    _currentScreen = newScreen;
  }
}