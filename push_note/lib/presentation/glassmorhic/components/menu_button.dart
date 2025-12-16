import 'package:flutter_svg/flutter_svg.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/neo/neo_style.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/color_extension.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation2/colors_resolver.dart';
import 'package:push_note/presentation2/widgets/brut/brut_cluster.dart';

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
    final style = context.read<SettingsProvider>().styleType;
    return switch (style) {
      StyleType.glass => _GlassMenuButton(options: options, child: child),
      StyleType.brut => _BrutMenuButton(options: options, child: child),
      StyleType.neo => _NeoMenuButton(options: options, child: child),
    };
  }
}

class _GlassMenuButton extends StatelessWidget {
  final Widget child;
  final List<CustomMenuItemButton> options;
  const _GlassMenuButton({
    required this.child,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: const Offset(180, -20),
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              child: this.child,
              onTap: () => controller.open(),
            ));
      },
      style: MenuStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundColor: WidgetStateProperty.all(AppColors.glassBack),
      ),
      menuChildren: options,
    );
  }
}

class _BrutMenuButton extends StatelessWidget {
  final Widget child;
  final List<CustomMenuItemButton> options;
  const _BrutMenuButton({
    required this.child,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: const Offset(180, -20),
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return BrutCluster(
          isCard: true,
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: this.child,
                onTap: () => controller.open(),
              )),
        );
      },
      style: MenuStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        backgroundColor: WidgetStateProperty.all(AppColors.white),
      ),
      menuChildren: options,
    );
  }
}

class _NeoMenuButton extends StatelessWidget {
  final Widget child;
  final List<CustomMenuItemButton> options;
  const _NeoMenuButton({
    required this.child,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: const Offset(180, -20),
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return NeumorphicButton(
          onPressed: () => controller.open(),
          style: neoStyle,
          child: this.child,
        );
      },
      style: MenuStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
        backgroundColor: WidgetStateProperty.all(AppColors.white),
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
    final style = context.read<SettingsProvider>().styleType;
    final color = ColorsResolver.textColor(style);
    final hoverColor = ColorsResolver.hoverColor(style);

    return MenuItemButton(
      onPressed: onPressed,
      style: ButtonStyle(overlayColor: WidgetStatePropertyAll(hoverColor)),
      child: SizedBox(
        width: 100,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
              colorFilter: color.toFilter,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: RobotoTextStyle.small_12_reg.copyWith(color: color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
