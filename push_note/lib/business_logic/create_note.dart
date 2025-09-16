import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/dto/notes_colors_type.dart';
import 'package:push_note/main/main_variables.dart';

Future<void> createNote(
  String text,
  NotesColorsEnum? type,
) async {
  final String imagePath = await getImageFilePathFromAssets(getImage(type));

  AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    // Unique channel ID
    'push_note',
    // Channel name visible in settings
    'Push Note',
    category: AndroidNotificationCategory.event,
    importance: Importance.max,
    priority: Priority.max,
    ticker: text,
    largeIcon: FilePathAndroidBitmap(imagePath),
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
    text.hashCode + type.hashCode,
    null,
    text,
    platformChannelSpecifics,
  );
}

Future<String> getImageFilePathFromAssets(String assetPath) async {
  final byteData = await rootBundle.load(assetPath);
  final file = File('${(await getTemporaryDirectory()).path}/${assetPath.split('/').last}');
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  return file.path;
}

String getImage(NotesColorsEnum? type) {
  return switch (type) {
    NotesColorsEnum.red => AppImages.statusHigh,
    NotesColorsEnum.orange => AppImages.statusPreHigh,
    NotesColorsEnum.yellow => AppImages.statusMiddle,
    NotesColorsEnum.green => AppImages.statusPreMiddle,
    NotesColorsEnum.blue => AppImages.statusLow,
    null => AppImages.logo,
  };
}
