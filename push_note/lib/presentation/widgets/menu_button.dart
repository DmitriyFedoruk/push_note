import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final String icon;
  const CustomMenuItemButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      onPressed: onPressed,
      // style: ButtonStyle(overlayColor: WidgetStatePropertyAll(hoverColor)),
      child: SizedBox(
        width: 100,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
              // colorFilter: color.toFilter,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: RobotoTextStyle.small_12_reg.copyWith(
                  // color: color
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
