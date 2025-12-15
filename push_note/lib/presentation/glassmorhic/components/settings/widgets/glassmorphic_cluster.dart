import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:push_note/extensions/theme_extension.dart';

class GlassmorphicCluster extends StatelessWidget {
  final Widget child;
  final double height;
  const GlassmorphicCluster(this.child, {this.height = 192, super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.theme.cardColor;
    return GlassContainer.clearGlass(
      width: double.infinity,
      height: 200,
      child: child,
    );
    GlassmorphicContainer(
        width: double.infinity,
        height: height,
        borderRadius: 12,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.2),
            color.withValues(alpha: 0),
          ],
        ),
        border: 2,
        blur: 24,
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 1),
            color.withValues(alpha: 0.1),
          ],
        ),
        child: child);
  }
}
