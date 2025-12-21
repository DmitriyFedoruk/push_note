import 'package:flutter/material.dart';
import 'package:push_note/const/styles/colors.dart';

class UniversalCluster extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final VoidCallback? onTap;
  const UniversalCluster({
    required this.child,
    this.borderWidth = 1.5,
    this.onTap,
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
      child: onTap != null
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: child,
                  )),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: child,
            ),
    );
  }
}
