import 'package:flutter/material.dart';

class TapSector extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  const TapSector({super.key, required this.child, required this.onTap, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: child,
        ),
      ),
    );
  }
}
