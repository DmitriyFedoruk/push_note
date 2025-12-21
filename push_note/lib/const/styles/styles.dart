// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BebasTextStyle {
  static final TextStyle appBarTextStyle = GoogleFonts.bebasNeue(
    fontSize: 60.0,
    fontWeight: FontWeight.w400,
    height: 60,
  );

  static final TextStyle middle_24 = GoogleFonts.bebasNeue(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle middle = GoogleFonts.bebasNeue(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );
}

class RobotoTextStyle {
  static final TextStyle middle = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle middle14 = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle small_12 = GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle small_12_reg = GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
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
