import 'package:material_ui/material_ui.dart';

extension ColorExt on Color {
  ColorFilter get toFilter {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}
