import 'package:flutter/material.dart';
import 'package:push_note/const/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  const CustomButton({
    required this.onTap,
    required this.child,
    super.key,
  });

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
      color: AppColors.buttonColor.withValues(alpha: 0.2),
      disabledColor: AppColors.disabledColor,
      highlightColor: Colors.transparent,
      splashColor: AppColors.buttonSplashColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
