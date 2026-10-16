import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:push_note/business_logic/functions.dart';
import 'package:push_note/business_logic/services/notification_display.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/infra/date_extension.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation/widgets/custom_button.dart';
import 'package:push_note/presentation/widgets/main_screen/list_of_types.dart';
import 'package:push_note/presentation/widgets/main_screen/speech_to_text_note.dart';
import 'package:push_note/presentation/widgets/main_screen/title_field.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';

class CreateNoteCluster extends StatefulWidget {
  const CreateNoteCluster({super.key});

  @override
  State<CreateNoteCluster> createState() => _CreateNoteClusterState();
}

class _CreateNoteClusterState extends State<CreateNoteCluster> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isDisabled = true;
  NotesColorsEnum? noteType;
  DateTime? scheduledDate;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_simpleListener);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final provider = context.read<NotesProvider>();
    final timeFormatType = context.select((SettingsProvider prov) => prov.timeFormatType);
    String time = '';
    if (scheduledDate != null) {
      final scheduledTime = scheduledDate!.toReadFormat(timeFormatType);
      time = '${t.scheduledAt} ${scheduledTime.last} (${scheduledTime.first})';
    }
    return Column(
      children: [
        TitleField(_controller, _scrollController),
        const SizedBox(height: 24.0),
        ListOfTypes(
          selectedItem: noteType,
          chooseItem: chooseItem,
        ),
        if (scheduledDate != null)
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: UniversalCluster(
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  time,
                  style: RobotoTextStyle.middle14,
                ),
              ),
            ),
          ),
        const SizedBox(height: 24.0),
        UniversalCluster(
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () async {
                    final res = await dateTimePickerMethod(context);
                    setState(() {
                      scheduledDate = res;
                    });
                  },
                  child: Icon(
                    Icons.calendar_month,
                    size: 24,
                    color: theme.primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                child: SpeechToTextNote(_controller, _scrollController),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 2,
                child: CustomButton(
                  onTap: isDisabled
                      ? null
                      : () async {
                          final isSuccess = await provider.addNote(
                            title: _controller.text,
                            type: noteType,
                            scheduledDate: scheduledDate,
                          );
                          if (isSuccess) {
                            clear();
                          } else {
                            NotificationDisplay.showInfo(t.accessForUsingNotifications);
                          }
                        },
                  child: Text(
                    t.create,
                    style: BebasTextStyle.middle_24.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void clear() {
    setState(() {
      _controller.clear();
      noteType = null;
      scheduledDate = null;
    });
  }

  void _simpleListener() {
    final newIsDisabled = _controller.text.isEmpty;
    if (newIsDisabled != isDisabled) {
      setState(() {
        isDisabled = newIsDisabled;
      });
    }
  }

  void chooseItem(NotesColorsEnum item) {
    setState(() {
      if (noteType == item) {
        noteType = null;
      } else {
        noteType = item;
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_simpleListener);
    _controller.dispose();
    super.dispose();
  }
}
