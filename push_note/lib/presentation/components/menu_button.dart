import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/color_extension.dart';
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
      menuChildren: options,
    );
  }
}

class CustomMenuItemButton extends StatelessWidget {
  const CustomMenuItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class CustomMenuItemButtonWithText extends CustomMenuItemButton {
  final VoidCallback onPressed;
  final String text;
  const CustomMenuItemButtonWithText({
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

class CustomMenuItemButtonWithIcon extends CustomMenuItemButton {
  final VoidCallback onPressed;
  final String text;
  final String icon;
  const CustomMenuItemButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return MenuItemButton(
      onPressed: onPressed,
      style: ButtonStyle(overlayColor: WidgetStatePropertyAll(theme.hoverColor)),
      child: SizedBox(
        width: 100,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
              colorFilter: theme.textTheme.labelMedium?.color?.toFilter,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: RobotoTextStyle.small_12_reg.copyWith(color: theme.textTheme.labelMedium?.color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
