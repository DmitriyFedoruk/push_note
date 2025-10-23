import 'package:push_note/const/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _backgroundKey = 'background';
  static const String _cardFillTypeKey = 'cardFillTypeKey';
  static const String _timeFormatTypeKey = 'timeFormatTypeKey';

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
}
