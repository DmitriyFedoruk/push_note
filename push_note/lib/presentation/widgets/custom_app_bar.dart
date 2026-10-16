import 'package:material_ui/material_ui.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar(this.title, {super.key});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: _Text(title),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  const CustomSliverAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: _Text(title),
      backgroundColor: Colors.transparent,
    );
  }
}

class _Text extends StatelessWidget {
  final String title;
  const _Text(this.title);

  @override
  Widget build(BuildContext context) {
    final color = context.theme.cardColor;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 12),
      child: Text(
        title,
        style: BebasTextStyle.appBarTextStyle.copyWith(color: color),
      ),
    );
  }
}
