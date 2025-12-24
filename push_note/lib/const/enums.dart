import 'package:push_note/const/images.dart';

enum BackgroundType {
  back1(AppImages.back1),
  back2(AppImages.back2),
  back3(AppImages.back3),
  back4(AppImages.back4),
  back5(AppImages.back5);

  final String path;
  const BackgroundType(this.path);

  factory BackgroundType.fromString(String str) {
    return switch (str) {
      'back1' => BackgroundType.back1,
      'back2' => BackgroundType.back2,
      'back3' => BackgroundType.back3,
      'back4' => BackgroundType.back4,
      'back5' => BackgroundType.back5,
      String() => BackgroundType.back5,
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
