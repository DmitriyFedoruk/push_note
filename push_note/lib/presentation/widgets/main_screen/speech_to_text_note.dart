import 'package:flutter/material.dart';
import 'package:push_note/business_logic/services/notification_display.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/custom_button.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextNote extends StatefulWidget {
  final TextEditingController controller;
  final ScrollController scrollController;
  const SpeechToTextNote(this.controller, this.scrollController, {super.key});

  @override
  State<SpeechToTextNote> createState() => _SpeechToTextNoteState();
}

class _SpeechToTextNoteState extends State<SpeechToTextNote> {
  late final SpeechToText _speechToText;
  bool _speechEnabled = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechToText = SpeechToText();
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    if (!_speechEnabled) {
      NotificationDisplay.showInfo(t.speechNotAvailable);
      return;
    }
    await _speechToText.listen(onResult: _onSpeechResult, localeId: LocaleSettings.currentLocale.languageCode);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    widget.controller.text = result.recognizedWords;
    widget.scrollController.animateTo(
      widget.scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _speechToText.isNotListening
        ? CustomButton(
            onTap: _startListening,
            child: Icon(
              Icons.mic_rounded,
              size: 24,
              color: context.theme.primaryColor,
            ),
          )
        : CustomButton(
            onTap: _stopListening,
            child: Icon(
              Icons.mic_off_rounded,
              size: 24,
              color: context.theme.primaryColor,
            ),
          );
  }
}
