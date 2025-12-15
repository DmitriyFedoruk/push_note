import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/presentation/brutalism/components/settings/widgets/brutalism_cluster.dart';
import 'package:push_note/presentation/glassmorhic/components/settings/widgets/glassmorphic_cluster.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';

class UniversalCluster extends StatelessWidget {
  final Widget child;
  final double height;
  const UniversalCluster(this.child, {this.height = 192, super.key});

  @override
  Widget build(BuildContext context) {
    final styleType = context.select((SettingsProvider prov) => prov.styleType);
    return switch (styleType) {
      StyleType.glass => GlassmorphicCluster(
          child,
          height: height,
        ),
      StyleType.neo => throw UnimplementedError(),
      StyleType.brut => BrutalismCluster(
          child,
          height: height,
        ),
    };
  }
}
