import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/presentation/components/create_note_cluster.dart';
import 'package:push_note/presentation/components/main_app_bar.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(context.read<SettingsProvider>().background.image), context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: const MainAppbar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTap: () {
              SystemNavigator.pop();
            },
            child: SizedBox(
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
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 200.0,
            ),
            child: CreateNoteCluster(),
          )
        ],
      ),
    );
  }
}
