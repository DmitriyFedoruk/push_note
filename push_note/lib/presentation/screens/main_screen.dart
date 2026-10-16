import 'package:material_ui/material_ui.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/presentation/widgets/background.dart';
import 'package:push_note/presentation/widgets/custom_app_bar.dart';
import 'package:push_note/presentation/widgets/main_screen/create_note_cluster.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(AppStrings.appName),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Background(),
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              top: 120,
              right: 30,
              bottom: 30,
            ),
            child: CreateNoteCluster(),
          )
        ],
      ),
    );
  }
}
