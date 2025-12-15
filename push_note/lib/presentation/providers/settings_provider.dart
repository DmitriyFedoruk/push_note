import 'package:flutter/material.dart';
import 'package:push_note/business_logic/services/shared_preferences_service.dart';
import 'package:push_note/const/enums.dart';

class SettingsProvider extends ChangeNotifier {
  StyleType styleType = StyleType.glass;

  AppBackgrounds background = AppBackgrounds.background1;
  CardFillType cardFillType = CardFillType.gradient;
  TimeFormatType timeFormatType = TimeFormatType.hours24;

  SettingsProvider() {
    initialLoad();
  }

  void initialLoad() {
    styleType = SharedPreferencesService.getStyleType();

    background = AppBackgrounds.fromString(
        SharedPreferencesService.getBackgroundString());
    cardFillType = SharedPreferencesService.getCardFillType();
    timeFormatType = SharedPreferencesService.getTimeFormatType();
    notifyListeners();
  }

  void setStyleType(StyleType type) {
    styleType = type;
    SharedPreferencesService.setStyleType(type);
    notifyListeners();
  }

  void setBackground(AppBackgrounds bk) {
    background = bk;
    SharedPreferencesService.setBackgroundString(bk.name);
    notifyListeners();
  }

  void setCardFillType(CardFillType type) {
    cardFillType = type;
    SharedPreferencesService.setCardFillType(type);
    notifyListeners();
  }

  void setTimeFormatType(TimeFormatType type) {
    timeFormatType = type;
    SharedPreferencesService.setTimeFormatType(type);
    notifyListeners();
  }
}
