import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation2/widgets/widget_resolver.dart';

class UniversalCluster extends StatelessWidget {
  final Widget child;
  const UniversalCluster(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final style = context.select((SettingsProvider prov) => prov.styleType);
    return WidgetResolver.cluster(style, child: child);
  }
}
