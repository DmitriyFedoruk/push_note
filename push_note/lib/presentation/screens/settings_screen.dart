import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/presentation/components/settings/background_cluster.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: const MainAppbar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Selector<SettingsProvider, String>(
              selector: (_, prov) => prov.background,
              builder: (context, background, _) {
                return Image.asset(
                  background,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const SizedBox(height: 14.0),
                  BackgroundCluster(),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
