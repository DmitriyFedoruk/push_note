import 'package:flutter/material.dart';
import 'package:push_note/const/styles/colors.dart';

ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    cardColor: AppColors.white,
    textTheme: TextTheme(bodyMedium: TextStyle(color: AppColors.white)));

ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    cardColor: AppColors.black,
    textTheme: TextTheme(bodyMedium: TextStyle(color: AppColors.black)));
