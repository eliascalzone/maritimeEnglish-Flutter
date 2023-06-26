class UserModel {
  UserModel(bool darkmode, int highscore) {
    _darkMode = darkmode;
    _highscore = highscore;
  }

  //Dark Mode
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  void enableDarkMode(bool value) {
    _darkMode = value;
  }


  int _highscore = 0;

  int get highscore => _highscore;

  void setHighscore(int newScore){
    _highscore = newScore;
  }
}