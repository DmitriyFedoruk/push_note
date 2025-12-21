import 'package:flutter/material.dart';
import 'package:push_note/const/styles/colors.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      cardColor: AppColors.black,
      primaryColor: AppColors.white,
      dividerColor: AppColors.grey,
      splashColor: AppColors.accentColor,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.black),
        labelMedium: TextStyle(color: AppColors.white),
        labelLarge: TextStyle(
          color: AppColors.greyDark,
        ),
      ),
      shadowColor: AppColors.black,
      hoverColor: AppColors.greyDark,
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      cardColor: AppColors.black,
      dividerColor: AppColors.black,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.black),
        labelMedium: TextStyle(color: AppColors.white),
        labelLarge: TextStyle(
          color: AppColors.turquoise,
        ),
      ),
      shadowColor: AppColors.white,
      hoverColor: AppColors.greyDark,
    );
