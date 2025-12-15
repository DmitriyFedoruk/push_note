import 'package:flutter/material.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/presentation2/widgets/base/app_cluster.dart';

class BrutCluster extends AppCluster {
  final Widget child;
  const BrutCluster(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignInside,
          color: AppColors.black,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }
}
