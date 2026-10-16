import 'package:material_ui/material_ui.dart';
import 'package:push_note/extensions/theme_extension.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  const CustomButton({
    required this.onTap,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return MaterialButton(
      height: 48.0,
      elevation: 0,
      disabledElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      enableFeedback: false,
      color: theme.cardColor,
      disabledColor: theme.dividerColor,
      highlightColor: Colors.transparent,
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: child,
    );
  }
}
