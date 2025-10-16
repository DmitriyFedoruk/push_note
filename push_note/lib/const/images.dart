class AppImages {
  static const String background = 'assets/background.jpg';
  static const String background1 = 'assets/background1.png';
  static const String background2 = 'assets/background2.png';
  static const String background3 = 'assets/background3.png';

  static const String logo = 'assets/logo.png';
  static const String statusHigh = 'assets/status_high.png';
  static const String statusPreHigh = 'assets/status_pre_high.png';
  static const String statusMiddle = 'assets/status_middle.png';
  static const String statusPreMiddle = 'assets/status_pre_middle.png';
  static const String statusLow = 'assets/status_low.png';

  static String getBackground(String name) {
    return switch (name) {
      background1 => background1,
      background2 => background2,
      background3 => background3,
      String() => background1,
    };
  }
}

class AppIcons {
  static const String background = 'assets/icons/background.svg';
}
