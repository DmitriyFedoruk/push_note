import 'package:material_ui/material_ui.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:toastification/toastification.dart';

class NotificationDisplay {
  static ToastificationItem showInfo(String text, {int seconds = 10}) {
    return toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.flat,
      title: Text(
        text,
        style: BebasTextStyle.small,
        maxLines: 5,
      ),
      autoCloseDuration: Duration(seconds: seconds),
      showProgressBar: false,
    );
  }
}
