import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _backgroundKey = 'background';
  static const String _themeKey = 'themeKey';

  static late SharedPreferences _prefs;

  static SharedPreferencesService? instance;

  static SharedPreferencesService getInstance() {
    instance ??= SharedPreferencesService();
    return instance!;
  }

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //Methods

  //Background
  static void setBackgroundString(String background) {
    _prefs.setString(_backgroundKey, background);
  }

  static String getBackgroundString() {
    return _prefs.getString(_backgroundKey) ?? '';
  }
}
