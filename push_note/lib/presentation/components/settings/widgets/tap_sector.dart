import 'package:flutter/material.dart';

class TapSector extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const TapSector({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: child,
        ),
      ),
    );
  }
}
