import 'package:flutter/material.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';

class MenuButton extends StatelessWidget {
  final Widget child;
  final List<CustomMenuItemButton> options;
  final Offset? offset;
  const MenuButton({
    required this.child,
    required this.options,
    this.offset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return MenuAnchor(
        alignmentOffset: offset,
        builder: (BuildContext context, MenuController controller, Widget? child) {
          return Material(
              color: Colors.transparent,
              child: InkWell(
                child: this.child,
                onTap: () => controller.open(),
              ));
        },
        style: MenuStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          backgroundColor: WidgetStateProperty.all(theme.cardColor),
        ),
        menuChildren: options);
  }
}

class CustomMenuItemButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomMenuItemButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return MenuItemButton(
      onPressed: onPressed,
      style: ButtonStyle(overlayColor: WidgetStatePropertyAll(theme.hoverColor)),
      child: SizedBox(
        width: 100,
        child: Text(
          text,
          style: RobotoTextStyle.small_12_reg.copyWith(color: theme.textTheme.labelMedium?.color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
