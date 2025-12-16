import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation2/widgets/widget_resolver.dart';

class UniversalTitle extends StatelessWidget {
  final String icon;
  final String title;
  const UniversalTitle({required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final style = context.select((SettingsProvider prov) => prov.styleType);
    return WidgetResolver.title(style, icon: icon, title: title);
  }
}
