import 'package:flutter/material.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/background.dart';
import 'package:push_note/presentation/widgets/custom_app_bar.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppbar(t.progress),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            const Background(),
            Center(
                child: UniversalCluster(
                    child: Text(
              t.comingSoon,
              style: BebasTextStyle.middle,
            ))),
          ],
        ));
  }
}
