import 'package:material_ui/material_ui.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  const CustomSliverAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: _Title(title),
      backgroundColor: Colors.transparent,
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title(
    this.title,
  );

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
