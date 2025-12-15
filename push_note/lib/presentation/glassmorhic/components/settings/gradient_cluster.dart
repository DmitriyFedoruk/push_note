// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:push_note/const/enums.dart';
// import 'package:push_note/const/images.dart';
// import 'package:push_note/domain/dto/notes_colors_type.dart';
// import 'package:push_note/domain/models/note.dart';
// import 'package:push_note/gen/strings.g.dart';
// import 'package:push_note/presentation/glassmorhic/components/cards/glassmorphic_card.dart';
// import 'package:push_note/presentation/glassmorhic/components/settings/widgets/custom_radio_button.dart';
// import 'package:push_note/presentation/glassmorhic/components/settings/widgets/tap_sector.dart';
// import 'package:push_note/presentation/glassmorhic/components/settings/widgets/title_for_cluster.dart';
// import 'package:push_note/presentation/providers/settings_provider.dart';
// import 'package:push_note/presentation/widgets/custom_card.dart';
// import 'package:push_note/presentation/widgets/universal_cluster.dart';

// class GradientCluster extends StatelessWidget {
//   const GradientCluster({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final t = Translations.of(context);
//     return Column(
//       children: [
//         TitleForCluster(
//           icon: AppIcons.gradient,
//           title: t.gradient,
//         ),
//         const UniversalCluster(
//           _OptionsList(),
//           height: 264,
//         ),
//       ],
//     );
//   }
// }

// class _OptionsList extends StatelessWidget {
//   const _OptionsList();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
//         child: Selector<SettingsProvider, CardFillType>(
//             selector: (_, s) => s.cardFillType,
//             builder: (context, cardFillType, _) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _OneItem(
//                     type: CardFillType.gradient,
//                     activeType: cardFillType,
//                   ),
//                   _OneItem(
//                     type: CardFillType.plain,
//                     activeType: cardFillType,
//                   ),
//                 ],
//               );
//             }));
//   }
// }

// class _OneItem extends StatelessWidget {
//   final CardFillType type;
//   final CardFillType activeType;
//   const _OneItem({
//     required this.type,
//     required this.activeType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final t = Translations.of(context);
//     return TapSector(
//       onTap: () => context.read<SettingsProvider>().setCardFillType(type),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Selector<SettingsProvider, TimeFormatType>(
//             selector: (_, s) => s.timeFormatType,
//             builder: (context, timeFormatType, _) {
//               return CustomCard(
//                 type: type,
//                 note: Note(
//                   title: t.createNewTask,
//                   createdAt: DateTime.now(),
//                   type: NotesColorsEnum.red,
//                   scheduledDate: null,
//                 ),
//                 timeFormatType: timeFormatType,
//               );
//             },
//           ),
//           const SizedBox(height: 12),
//           CustomRadioButton(isActive: type == activeType),
//         ],
//       ),
//     );
//   }
// }
