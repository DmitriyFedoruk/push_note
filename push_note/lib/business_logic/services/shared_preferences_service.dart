import 'package:push_note/const/enums.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _styleTypeKey = 'styleTypeKey';

  static const String _backgroundKey = 'background';
  static const String _cardFillTypeKey = 'cardFillTypeKey';
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

  //Style
  static void setStyleType(StyleType styleType) {
    _prefs.setString(_styleTypeKey, styleType.name);
  }

  static StyleType getStyleType() {
    return StyleType.fromString(_prefs.getString(_backgroundKey) ?? '');
  }

  //Background
  static void setBackgroundString(String background) {
    _prefs.setString(_backgroundKey, background);
  }

  static String getBackgroundString() {
    return _prefs.getString(_backgroundKey) ?? '';
  }

  //CardFillType
  static void setCardFillType(CardFillType type) {
    _prefs.setString(_cardFillTypeKey, type.name);
  }

  static CardFillType getCardFillType() {
    return CardFillType.fromString(_prefs.getString(_cardFillTypeKey) ?? '');
  }

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
