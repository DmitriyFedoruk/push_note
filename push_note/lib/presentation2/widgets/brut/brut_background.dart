import 'package:flutter/material.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/presentation2/widgets/base/app_background.dart';

class BrutBackground extends AppBackground {
  const BrutBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.background1,
      fit: BoxFit.cover,
    );
  }
}
