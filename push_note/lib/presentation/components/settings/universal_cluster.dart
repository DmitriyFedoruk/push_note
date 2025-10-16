import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:push_note/const/colors.dart';

class UniversalCluster extends StatelessWidget {
  final Widget child;
  const UniversalCluster(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
        width: double.infinity,
        height: 192,
        borderRadius: 12,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.white.withValues(alpha: 0.2),
            AppColors.white.withValues(alpha: 0),
          ],
        ),
        border: 2,
        blur: 24,
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.white.withValues(alpha: 1),
            AppColors.white.withValues(alpha: 0.1),
          ],
        ),
        child: child);
  }
}
