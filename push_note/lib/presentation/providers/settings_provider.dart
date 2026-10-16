import 'package:material_ui/material_ui.dart';
import 'package:push_note/business_logic/services/shared_preferences_service.dart';
import 'package:push_note/const/enums.dart';

class SettingsProvider extends ChangeNotifier {
  BackgroundType backgroundType = BackgroundType.back5;
  TimeFormatType timeFormatType = TimeFormatType.hours24;

  SettingsProvider() {
    initialLoad();
  }

  void initialLoad() {
    backgroundType = SharedPreferencesService.getBackgroundType();
    timeFormatType = SharedPreferencesService.getTimeFormatType();
    notifyListeners();
  }

  void setTimeFormatType(TimeFormatType type) {
    timeFormatType = type;
    SharedPreferencesService.setTimeFormatType(type);
    notifyListeners();
  }

  void setBackgroundType(BackgroundType type) {
    backgroundType = type;
    SharedPreferencesService.setBackgroundType(type);
    notifyListeners();
  }
}
