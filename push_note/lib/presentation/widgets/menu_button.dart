import 'package:flutter/material.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';

class MenuButton extends StatelessWidget {
  final Widget child;
  final List<CustomMenuItemButton> options;
  const MenuButton({
    required this.child,
    required this.options,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: const Offset(180, -20),
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return UniversalCluster(
          onTap: () => controller.open(),
          child: this.child,
        );
      },
      style: MenuStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        side: const WidgetStatePropertyAll(BorderSide(width: 1.5)),
        elevation: WidgetStateProperty.all(1.0),
        // padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        backgroundColor: WidgetStateProperty.all(context.theme.primaryColor),
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

class CustomMenuItemButtonWithIcon extends CustomMenuItemButton {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
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
      style: ButtonStyle(overlayColor: WidgetStatePropertyAll(theme.splashColor)),
      child: SizedBox(
        width: 100,
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: theme.cardColor,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: BebasTextStyle.superSmall.copyWith(color: theme.cardColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
