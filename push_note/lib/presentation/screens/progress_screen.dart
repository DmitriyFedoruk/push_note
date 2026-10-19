import 'package:material_ui/material_ui.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/background.dart';
import 'package:push_note/presentation/widgets/custom_app_bar.dart';
import 'package:push_note/presentation/widgets/progress_screen/count_of_tasks_chart.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          CustomScrollView(
            slivers: [
              CustomSliverAppBar(t.progress),
              const SliverToBoxAdapter(child: CountOfTasksChart()),
            ],
          ),
        ],
      ),
    );
  }
}
