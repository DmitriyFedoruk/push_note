import 'package:flutter/material.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:toastification/toastification.dart';

class NotificationDisplay {
  static ToastificationItem showInfo(String text, {int seconds = 10}) {
    return toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.flat,
      title: Text(text, style: BebasTextStyle.small),
      autoCloseDuration: Duration(seconds: seconds),
      showProgressBar: false,
    );
  }
}
