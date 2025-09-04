import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_note/main/main_variables.dart';

Future<void> createNote(String text) async {
  AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    // Unique channel ID
    'push_note',
    // Channel name visible in settings
    'Push Note',
    importance: Importance.high,
    priority: Priority.high,
    ticker: text,
  );

  //  DarwinNotificationDetails iOSPlatformChannelSpecifics = DarwinNotificationDetails(
  //      threadIdentifier: 'push_note',
  //     subtitle: text,
  //     );

  NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    //iOS: iOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    text.hashCode,
    null,
    text,
    platformChannelSpecifics,
  );
}
