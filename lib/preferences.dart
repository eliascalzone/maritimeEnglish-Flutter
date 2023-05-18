import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences preferences;

  static const keyDarkMode = 'darkmode';

  static const keyHighscore = 'highscore';

  static Future init() async {
    return preferences = await SharedPreferences.getInstance();
  }

  static Future setDarkMode(bool darkmode) async {
    return await preferences.setBool(keyDarkMode, darkmode);
  }

  static bool? getDarkmode() {
    return preferences.getBool(keyDarkMode);
  }

  static Future setHighscore(int highscore) async {
    return await preferences.setInt(keyHighscore, highscore);
  }

  static int? getHighscore(){
    return preferences.getInt(keyHighscore);
  }
}
