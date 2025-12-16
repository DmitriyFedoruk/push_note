import 'package:flutter/material.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/presentation2/widgets/base/app_background.dart';

class NeoBackground extends AppBackground {
  const NeoBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: AppColors.lightGrey);
  }
}
