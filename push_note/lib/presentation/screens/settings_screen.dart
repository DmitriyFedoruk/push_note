import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/presentation/components/app_bar/settings_app_bar.dart';
import 'package:push_note/presentation/components/settings/background_cluster.dart';
import 'package:push_note/presentation/components/settings/gradient_cluster.dart';
import 'package:push_note/presentation/components/settings/theme_cluster.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const SettingsAppbar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Selector<SettingsProvider, AppBackgrounds>(
              selector: (_, prov) => prov.background,
              builder: (context, background, _) {
                return Image.asset(
                  background.image,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(height: 14.0),
                  BackgroundCluster(),
                  SizedBox(height: 36.0),
                  ThemeCluster(),
                  SizedBox(height: 36.0),
                  GradientCluster(),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
