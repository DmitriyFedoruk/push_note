import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:push_note/business_logic/services/shared_preferences_service.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> initLocale() async {
  await configureLocalTimeZone();
  AppLocale? currentLocale = SharedPreferencesService.getLocale();
  if (currentLocale == null) {
    currentLocale = await LocaleSettings.useDeviceLocale();
    SharedPreferencesService.setLocale(currentLocale);
  }

  LocaleSettings.setLocale(currentLocale);
}

Future<void> configureLocalTimeZone() async {
  tz.initializeTimeZones();
  final timeZone = await FlutterTimezone.getLocalTimezone();
  final String timeZoneName = timeZone.identifier;
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}
