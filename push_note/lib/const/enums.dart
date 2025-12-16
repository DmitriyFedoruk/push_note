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
