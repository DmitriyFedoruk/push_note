import 'package:push_note/const/images.dart';

const String background1Str = 'background1';
const String background2Str = 'background2';
const String background3Str = 'background3';

enum AppBackgrounds {
  background1(name: background1Str, image: AppImages.background1),
  background2(name: background2Str, image: AppImages.background2),
  background3(name: background3Str, image: AppImages.background3);

  final String name;
  final String image;
  const AppBackgrounds({required this.name, required this.image});

  factory AppBackgrounds.fromString(String name) {
    return switch (name) {
      background1Str => background1,
      background2Str => background2,
      background3Str => background3,
      String() => background1,
    };
  }
}

enum CardFillType {
  gradient,
  plain;

  factory CardFillType.fromString(String str) {
    return switch (str) {
      'gradient' => CardFillType.gradient,
      'plain' => CardFillType.plain,
      String() => CardFillType.gradient,
    };
  }
}

enum TimeFormatType {
  hours24,
  hours12;

  factory TimeFormatType.fromString(String str) {
    return switch (str) {
      'hours24' => TimeFormatType.hours24,
      'hours12' => TimeFormatType.hours12,
      String() => TimeFormatType.hours24,
    };
  }
}

enum StyleType {
  glassmorphic,
  neumorphic,
  brutalism;

  factory StyleType.fromString(String str) {
    return switch (str) {
      'glassmorphic' => StyleType.glassmorphic,
      'neumorphic' => StyleType.neumorphic,
      'brutalism' => StyleType.brutalism,
      String() => StyleType.glassmorphic,
    };
  }
}
