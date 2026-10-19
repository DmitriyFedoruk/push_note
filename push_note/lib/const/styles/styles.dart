import 'package:material_ui/material_ui.dart';

class BebasTextStyle {
  static const TextStyle appBarTextStyle = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 60.0,
    fontWeight: FontWeight.w600,
    height: 0.9,
  );

  static const TextStyle middle_24 = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle middle = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle small = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle superSmall = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
}

class RobotoTextStyle {
  static const TextStyle middle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
  // GoogleFonts.roboto(
  //   fontSize: 18.0,
  //   fontWeight: FontWeight.w600,
  // );

  static const TextStyle middle14 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );
  // GoogleFonts.roboto(
  //   fontSize: 18.0,
  //   fontWeight: FontWeight.w400,
  // );

  static const TextStyle small_12 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );
  // GoogleFonts.roboto(
  //   fontSize: 12.0,
  //   fontWeight: FontWeight.w500,
  // );

  // ignore: constant_identifier_names
  static const TextStyle small_12_reg = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
  // GoogleFonts.roboto(
  //   fontSize: 12.0,
  //   fontWeight: FontWeight.w400,
  // );

  static const TextStyle small_10 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
  );
  // GoogleFonts.roboto(
  //   fontSize: 10.0,
  //   fontWeight: FontWeight.w400,
  // );

  static const TextStyle small_8 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 8.0,
    fontWeight: FontWeight.w500,
  );
  // GoogleFonts.roboto(
  //   fontSize: 8.0,
  //   fontWeight: FontWeight.w500,
  // );
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
