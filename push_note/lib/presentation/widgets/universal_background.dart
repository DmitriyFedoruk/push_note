import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation2/widgets/widget_resolver.dart';

class UniversalBackground extends StatelessWidget {
  const UniversalBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final style = context.select((SettingsProvider prov) => prov.styleType);

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: WidgetResolver.background(style),
    );
  }
}
