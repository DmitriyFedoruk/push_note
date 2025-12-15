import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/presentation2/widgets/base/app_cluster.dart';

class GlassCluster extends AppCluster {
  final Widget child;
  const GlassCluster(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    const color = AppColors.black;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            color.withValues(alpha: 1),
            color.withValues(alpha: 0.3),
          ]),
          width: 2,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.5),
            color.withValues(alpha: 0),
          ],
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }
}
