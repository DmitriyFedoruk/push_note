import 'dart:developer';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:material_ui/material_ui.dart';
import 'package:push_note/business_logic/services/notification_display.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/custom_button.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
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
  Future<void> _initSpeech() async {
    _speechToText = SpeechToText();
    _speechEnabled = await _speechToText.initialize(
      onStatus: statusListener,
      onError: errorListener,
    );

    setState(() {});
  }

  void statusListener(String status) {
    log('Received listener status: $status, listening: ${_speechToText.isListening}');
  }

  void errorListener(SpeechRecognitionError error) {
    log('Received error status: $error, listening: ${_speechToText.isListening}');
    if (error.errorMsg == 'error_language_not_supported') {
      NotificationDisplay.showInfo(t.languageNotSupported);
    } else {
      NotificationDisplay.showInfo(t.somethingWentWrong);
    }
    widget.controller.clear();

    _stopListening();
  }

  /// Each time to start a speech recognition session
  Future<void> _startListening() async {
    if (!_speechEnabled || !_speechToText.isAvailable) {
      NotificationDisplay.showInfo(t.speechNotAvailable);
      return;
    }
    //Russian locale work better. Because it gave an opportunity to use both English and Russian languages
    // LocaleSettings.currentLocale.languageCode
    await _speechToText.listen(onResult: _onSpeechResult, listenOptions: SpeechListenOptions(localeId: 'ru'));
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> _stopListening() async {
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
        : AvatarGlow(
            glowColor: AppColors.recordColor,
            glowRadiusFactor: 0.48,
            child: CustomButton(
              onTap: _stopListening,
              child: Icon(
                Icons.mic_off_rounded,
                size: 24,
                color: context.theme.primaryColor,
              ),
            ),
          );
  }
}
