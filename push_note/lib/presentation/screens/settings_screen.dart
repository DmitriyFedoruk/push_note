import 'package:flutter/material.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/background.dart';
import 'package:push_note/presentation/widgets/custom_app_bar.dart';
import 'package:push_note/presentation/widgets/settings/language_cluster.dart';

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
//       extendBodyBehindAppBar: true,
//       appBar: CustomAppbar(t.settings),
//       body: const Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           UniversalBackground(),
//           SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 30.0),
//                     StylesCluster(),
//                     SizedBox(height: 36.0),
//                     TimeFormatCluster(),
//                     SizedBox(height: 36.0),
//                     LanguageCluster(),
//                     SizedBox(height: 16.0),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
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
        const SliverPadding(padding: EdgeInsets.only(top: 30)),
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
