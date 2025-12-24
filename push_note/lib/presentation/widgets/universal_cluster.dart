import 'package:flutter/material.dart';
import 'package:push_note/extensions/theme_extension.dart';

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
    final theme = context.theme;
    return Container(
      decoration: BoxDecoration(
          color: theme.primaryColor,
          border: Border.all(
            strokeAlign: BorderSide.strokeAlignInside,
            color: theme.cardColor,
            width: borderWidth,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              color: theme.cardColor,
            )
          ]),
      child: onTap != null
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: child,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: child,
            ),
    );
  }
}
