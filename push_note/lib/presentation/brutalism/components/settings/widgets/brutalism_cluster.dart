import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:push_note/extensions/theme_extension.dart';

class BrutalismCluster extends StatelessWidget {
  final Widget child;
  final double height;
  const BrutalismCluster(this.child, {this.height = 192, super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.theme.cardColor;
    return GlassmorphicContainer(
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
