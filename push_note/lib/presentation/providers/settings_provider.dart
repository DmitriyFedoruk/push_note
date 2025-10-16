import 'package:flutter/foundation.dart';
import 'package:push_note/business_logic/services/shared_preferences_service.dart';
import 'package:push_note/const/images.dart';

class SettingsProvider extends ChangeNotifier {
  String background = AppImages.background1;

  SettingsProvider() {
    initialLoad();
  }

  void initialLoad() {
    background = AppImages.getBackground(SharedPreferencesService.getBackgroundString());
    notifyListeners();
  }
}
