import 'package:push_note/const/enums.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _timeFormatTypeKey = 'timeFormatTypeKey';
  static const String _localeTypeKey = 'localeTypeKey';

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

  //TimeFormatType
  static void setTimeFormatType(TimeFormatType type) {
    _prefs.setString(_timeFormatTypeKey, type.name);
  }

  static TimeFormatType getTimeFormatType() {
    return TimeFormatType.fromString(_prefs.getString(_timeFormatTypeKey) ?? '');
  }

  //TimeFormatType
  static void setLocale(AppLocale locale) {
    _prefs.setString(_localeTypeKey, locale.name);
  }

  static AppLocale? getLocale() {
    final locale = _prefs.getString(_localeTypeKey);
    return locale == 'ru'
        ? AppLocale.ru
        : locale == 'en'
            ? AppLocale.en
            : null;
  }
}
