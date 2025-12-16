import 'package:flutter/material.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/styles/colors.dart';

class ColorsResolver {
  static Color textColor(StyleType style) {
    switch (style) {
      case StyleType.glass:
        return AppColors.glassText;
      case StyleType.neo:
        return AppColors.neoText;
      case StyleType.brut:
        return AppColors.brutText;
    }
  }
}
