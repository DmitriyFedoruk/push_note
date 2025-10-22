import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/domain/dto/notes_colors_type.dart';
import 'package:push_note/domain/models/note.dart';
import 'package:push_note/presentation/components/cards/custon_card.dart';
import 'package:push_note/presentation/components/settings/widgets/custom_radio_button.dart';
import 'package:push_note/presentation/components/settings/widgets/tap_sector.dart';
import 'package:push_note/presentation/components/settings/widgets/title_for_cluster.dart';
import 'package:push_note/presentation/components/settings/widgets/universal_cluster.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';

class GradientCluster extends StatelessWidget {
  const GradientCluster({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleForCluster(icon: AppIcons.gradient, title: AppStrings.gradient),
        UniversalCluster(
          _OptionsList(),
          height: 264,
        ),
      ],
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Selector<SettingsProvider, CardFillType>(
            selector: (_, s) => s.cardFillType,
            builder: (context, cardFillType, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _OneItem(
                    type: CardFillType.gradient,
                    activeType: cardFillType,
                  ),
                  _OneItem(
                    type: CardFillType.plain,
                    activeType: cardFillType,
                  ),
                ],
              );
            }));
  }
}

class _OneItem extends StatelessWidget {
  final CardFillType type;
  final CardFillType activeType;
  const _OneItem({
    required this.type,
    required this.activeType,
  });

  @override
  Widget build(BuildContext context) {
    return TapSector(
      onTap: () => context.read<SettingsProvider>().setCardFillType(type),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCard(
            type: type,
            note: Note(
              title: AppStrings.createNewTask,
              createdAt: DateTime.now(),
              type: NotesColorsEnum.red,
            ),
          ),
          const SizedBox(height: 12),
          CustomRadioButton(isActive: type == activeType),
        ],
      ),
    );
  }
}
