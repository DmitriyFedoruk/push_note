import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_note/dto/notes_colors_type.dart';
import 'package:push_note/main/main_variables.dart';

Future<void> createNote(
  String text,
  NotesColorsEnum? type,
) async {
  AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    // Unique channel ID
    'push_note',
    // Channel name visible in settings
    'Push Note',
    category: AndroidNotificationCategory.event,
    importance: Importance.high,
    priority: Priority.high,
    ticker: text,
    colorized: true,
    color: type?.color,
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
