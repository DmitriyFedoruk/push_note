import 'package:flutter/material.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/background.dart';
import 'package:push_note/presentation/widgets/custom_app_bar.dart';
import 'package:push_note/presentation/widgets/progress_screen/count_of_tasks_chart.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(t.progress),
      body: const Stack(
        alignment: Alignment.topCenter,
        children: [
          Background(),
          Center(child: CountOfTasksChart()),
        ],
      ),
    );
  }
}
