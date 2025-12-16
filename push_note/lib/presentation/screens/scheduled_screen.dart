import 'package:flutter/material.dart';

class ScheduledScreen extends StatelessWidget {
  const ScheduledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       appBar: CustomAppbar(t.scheduled),
//       body: const Stack(children: [
//         UniversalBackground(),
//         _List(),
//       ]),
        );
  }
}

// class _List extends StatelessWidget {
//   const _List();

//   @override
//   Widget build(BuildContext context) {
//     final styleType = context.select((SettingsProvider prov) => prov.styleType);
//     final timeFormatType = context.select((SettingsProvider prov) => prov.timeFormatType);
//     return Consumer<NotesProvider>(builder: (context, prov, child) {
//       final scheduledNotes = prov.scheduledNotes;

//       return SliverPadding(
//         padding: const EdgeInsetsGeometry.symmetric(
//           horizontal: 24,
//           vertical: 40,
//         ),
//         sliver: SliverList.separated(
//           itemCount: scheduledNotes.length,
//           separatorBuilder: (context, index) {
//             return const SizedBox(height: 12);
//           },
//           itemBuilder: (context, index) {
//             return CustomCard(
//               styleType: styleType,
//               note: scheduledNotes[index],
//               timeFormatType: timeFormatType,
//               isScheduled: true,
//             );
//           },
//         ),
//       );
//     });
//   }
// }
