import 'package:flutter/material.dart';
import 'package:push_note/const/images.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        AppImages.background,
        fit: BoxFit.fill,
      ),
    );
  }
}
