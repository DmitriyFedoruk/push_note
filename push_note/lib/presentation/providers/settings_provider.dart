import 'package:flutter/material.dart';
import 'package:push_note/business_logic/services/shared_preferences_service.dart';
import 'package:push_note/const/enums.dart';

class SettingsProvider extends ChangeNotifier {
  TimeFormatType timeFormatType = TimeFormatType.hours24;

  SettingsProvider() {
    initialLoad();
  }

  void initialLoad() {
    timeFormatType = SharedPreferencesService.getTimeFormatType();
    notifyListeners();
  }

  void setTimeFormatType(TimeFormatType type) {
    timeFormatType = type;
    SharedPreferencesService.setTimeFormatType(type);
    notifyListeners();
  }
}
