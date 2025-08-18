import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_note/const/colors.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/const/styles.dart';
import 'package:push_note/main/main_variables.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 60.0,
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        enableFeedback: false,
        color: AppColors.buttonColor.withOpacity(0.2),
        highlightColor: Colors.transparent,
        splashColor: AppColors.buttonSplashColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        onPressed: () async {
          await showSimpleNotification();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.create,
              style: BodyTextStyle.buttonTextStyle,
            )
          ],
        ));
  }

  Future<void> showSimpleNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id', // Unique channel ID
      'your_channel_name', // Channel name visible in settings
      channelDescription: 'your_channel_description', // Channel description
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Simple Notification Title',
      'This is the body of your simple notification.',
      platformChannelSpecifics,
      payload: 'item x', // Optional payload
    );
  }
}
