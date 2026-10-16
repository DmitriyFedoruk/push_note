import 'package:material_ui/material_ui.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/background.dart';
import 'package:push_note/presentation/widgets/custom_app_bar.dart';
import 'package:push_note/presentation/widgets/settings/background_cluster.dart';
import 'package:push_note/presentation/widgets/settings/language_cluster.dart';
import 'package:push_note/presentation/widgets/settings/time_format_cluster.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Background(),
          _Body(),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(t.settings),
        const SliverPadding(padding: EdgeInsets.only(top: 60)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: BackgroundCluster(),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 36)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TimeFormatCluster(),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: LanguageCluster(),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 16))
      ],
    );
  }
}
