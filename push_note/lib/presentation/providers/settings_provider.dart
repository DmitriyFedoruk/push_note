import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:push_note/business_logic/services/shared_preferences_service.dart';
import 'package:push_note/const/enums.dart';

class SettingsProvider extends ChangeNotifier {
  AppBackgrounds background = AppBackgrounds.background1;
  CardFillType cardFillType = CardFillType.gradient;

  SettingsProvider() {
    initialLoad();
  }

  void initialLoad() {
    background = AppBackgrounds.fromString(SharedPreferencesService.getBackgroundString());
    cardFillType = SharedPreferencesService.getCardFillType();
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
}
