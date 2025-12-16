import 'package:flutter/material.dart';

abstract class AppTitle extends StatelessWidget {
  final String icon;
  final String title;
  const AppTitle({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
