import 'package:flutter/material.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/presentation2/widgets/base/app_cluster.dart';

class BrutCluster extends AppCluster {
  final Widget child;
  final double width;
  final bool isCard;
  const BrutCluster({required this.child, this.width = 2, this.isCard = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCard ? AppColors.white : Colors.transparent,
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignInside,
          color: AppColors.black,
          width: width,
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }
}
