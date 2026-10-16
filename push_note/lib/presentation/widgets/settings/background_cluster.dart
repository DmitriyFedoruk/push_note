import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/presentation/widgets/settings/custom_radio_button.dart';
import 'package:push_note/presentation/widgets/settings/tap_sector.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';
import 'package:push_note/presentation/widgets/universal_title.dart';

class BackgroundCluster extends StatelessWidget {
  const BackgroundCluster({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      children: [
        UniversalTitle(icon: AppIcons.background, title: t.background),
        const UniversalCluster(
          child: _OptionsList(),
        ),
      ],
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Selector<SettingsProvider, BackgroundType>(
          selector: (_, s) => s.backgroundType,
          builder: (context, backgroundType, _) {
            return Wrap(
                alignment: WrapAlignment.center,
                children: BackgroundType.values
                    .map(
                      (e) => _OneItem(
                        type: e,
                        activeType: backgroundType,
                      ),
                    )
                    .toList());
          }),
    );
  }
}

class _OneItem extends StatelessWidget {
  final BackgroundType type;
  final BackgroundType activeType;
  const _OneItem({
    required this.type,
    required this.activeType,
  });

  @override
  Widget build(BuildContext context) {
    return TapSector(
      onTap: () => context.read<SettingsProvider>().setBackgroundType(type),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Cluster(image: type.path),
          const SizedBox(height: 12),
          CustomRadioButton(isActive: type == activeType),
        ],
      ),
    );
  }
}

class _Cluster extends StatelessWidget {
  final String image;
  const _Cluster({required this.image});

  @override
  Widget build(BuildContext context) {
    return UniversalCluster(
      padding: 0,
      child: SizedBox(
        width: 60,
        height: 100,
        child: SvgPicture.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
