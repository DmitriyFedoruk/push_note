import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:push_note/const/enums.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/components/cards/custom_card.dart';
import 'package:push_note/presentation/providers/notes_provider.dart';
import 'package:push_note/presentation/providers/settings_provider.dart';
import 'package:push_note/routing/app_routes.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Positioned.fill(
            child: Selector<SettingsProvider, AppBackgrounds>(
              selector: (_, prov) => prov.background,
              builder: (context, background, _) {
                return Image.asset(
                  background.image,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                leading: IconButton(
                  onPressed: () {
                    context.go(AppRoutes.root);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: theme.cardColor,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  t.history,
                  style: DMSerifTextStyle.appBarTextStyle.copyWith(color: theme.cardColor),
                ),
                backgroundColor: theme.textTheme.labelMedium?.color,
              ),
              const _List(),
            ],
          ),
        ],
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    final type = context.select((SettingsProvider prov) => prov.cardFillType);
    final timeFormatType = context.select((SettingsProvider prov) => prov.timeFormatType);
    return Consumer<NotesProvider>(builder: (context, prov, child) {
      final historyNotes = prov.historyNotes;
      return SliverPadding(
        padding: const EdgeInsetsGeometry.symmetric(
          horizontal: 24,
          vertical: 40,
        ),
        sliver: SliverList.separated(
          itemCount: historyNotes.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 12);
          },
          itemBuilder: (context, index) {
            return CustomCard(
              type: type,
              note: historyNotes[index],
              timeFormatType: timeFormatType,
              isScheduled: false,
            );
          },
        ),
      );
    });
  }
}
