import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:push_note/const/styles/colors.dart';

class BodyTextStyle {
  static final TextStyle buttonTextStyle = GoogleFonts.dmSerifText(
    fontSize: 20.0,
    color: AppColors.white,
  );
  static final TextStyle appBarTextStyle = GoogleFonts.dmSerifText(
    fontSize: 40.0,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static final TextStyle typeTextStyle = GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
}

class RobotoTextStyle {
  static final TextStyle middle = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}
