import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/main/main_variables.dart';
import 'package:timezone/timezone.dart' as tz;

Future<void> createNote(
  String text,
  NotesColorsEnum? type,
  DateTime? date,
) async {
  final String imagePath = await getImageFilePathFromAssets(getImage(type));

  AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    // Unique channel ID
    'push_note',
    // Channel name visible in settings
    'Push Note',
    channelDescription: 'Channel for scheduled notes',
    category: AndroidNotificationCategory.event,
    importance: Importance.max,
    priority: Priority.max,
    ticker: text,
    largeIcon: FilePathAndroidBitmap(imagePath),
  );

  NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  if (date != null) {
    // Convert DateTime to TZDateTime
    final tz.TZDateTime scheduledTime = tz.TZDateTime.from(
      date,
      tz.local,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      text.hashCode + type.hashCode,
      null,
      text,
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      scheduledTime,
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  } else {
    await flutterLocalNotificationsPlugin.show(
      text.hashCode + type.hashCode,
      null,
      text,
      platformChannelSpecifics,
    );
  }
}

Future<String> getImageFilePathFromAssets(String assetPath) async {
  final byteData = await rootBundle.load(assetPath);
  final file = File('${(await getTemporaryDirectory()).path}/${assetPath.split('/').last}');
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  return file.path;
}
