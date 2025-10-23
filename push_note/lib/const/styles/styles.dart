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

class DMSerifTextStyle {
  static final TextStyle middle = GoogleFonts.dmSerifText(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );
}

class RobotoTextStyle {
  static final TextStyle middle = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle small_12 = GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle small_10 = GoogleFonts.roboto(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle small_8 = GoogleFonts.roboto(
    fontSize: 8.0,
    fontWeight: FontWeight.w500,
  );
}

List<BoxShadow> shadow(final Color color) => [
      BoxShadow(
        color: color.withValues(alpha: 0.25),
        blurRadius: 4.0,
        offset: const Offset(
          0,
          4.0,
        ),
      )
    ];
