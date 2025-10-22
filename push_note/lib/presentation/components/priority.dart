import 'package:flutter/material.dart';
import 'package:push_note/const/images.dart';

class Priority extends StatelessWidget {
  final int? priority;
  const Priority(this.priority, {super.key});

  @override
  Widget build(BuildContext context) {
    return priority == null
        ? const SizedBox.shrink()
        : Image.asset(
            _getImage(priority!),
            width: 30.0,
            height: 30.0,
          );
  }

  String _getImage(int priority) {
    return switch (priority) {
      5 => AppImages.statusHigh,
      4 => AppImages.statusPreHigh,
      3 => AppImages.statusMiddle,
      2 => AppImages.statusPreMiddle,
      1 => AppImages.statusLow,
      int() => AppImages.logo,
    };
  }
}
