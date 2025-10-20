import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyTextStyle {
  static final TextStyle buttonTextStyle = GoogleFonts.dmSerifText(
    fontSize: 20.0,
  );
  static final TextStyle appBarTextStyle = GoogleFonts.dmSerifText(
    fontSize: 40.0,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle typeTextStyle = GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}

class RobotoTextStyle {
  static final TextStyle middle = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle small = GoogleFonts.roboto(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
  );
}
