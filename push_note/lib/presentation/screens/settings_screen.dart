import 'package:flutter/material.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/glassmorhic/components/settings/language_cluster.dart';
import 'package:push_note/presentation/glassmorhic/components/settings/time_format_cluster.dart';
import 'package:push_note/presentation/widgets/custom_app_bar.dart';
import 'package:push_note/presentation/widgets/styles_cluster.dart';
import 'package:push_note/presentation/widgets/universal_background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(t.settings),
      body: const Stack(
        alignment: Alignment.topCenter,
        children: [
          UniversalBackground(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 30.0),
                    StylesCluster(),
                    SizedBox(height: 36.0),
                    TimeFormatCluster(),
                    SizedBox(height: 36.0),
                    LanguageCluster(),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
