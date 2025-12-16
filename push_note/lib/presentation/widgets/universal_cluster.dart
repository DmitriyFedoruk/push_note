import 'package:flutter/material.dart';
import 'package:push_note/const/styles/colors.dart';

class UniversalCluster extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  const UniversalCluster({
    required this.child,
    this.borderWidth = 1.5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            strokeAlign: BorderSide.strokeAlignInside,
            color: AppColors.black,
            width: borderWidth,
          ),
          boxShadow: const [BoxShadow(offset: Offset(4, 4), color: Colors.black)]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }
}
