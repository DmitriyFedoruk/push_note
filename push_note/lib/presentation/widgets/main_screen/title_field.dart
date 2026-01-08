import 'package:flutter/material.dart';
import 'package:push_note/const/styles/colors.dart';
import 'package:push_note/const/styles/styles.dart';
import 'package:push_note/extensions/theme_extension.dart';
import 'package:push_note/gen/strings.g.dart';
import 'package:push_note/presentation/widgets/universal_cluster.dart';

class TitleField extends StatelessWidget {
  final TextEditingController _controller;
  final ScrollController _scrollController;
  const TitleField(this._controller, this._scrollController, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return UniversalCluster(
      child: SizedBox(
        height: 60.0,
        child: TextFormField(
          controller: _controller,
          scrollController: _scrollController,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          textCapitalization: TextCapitalization.sentences,
          cursorColor: theme.cardColor,
          style: RobotoTextStyle.middle14.copyWith(color: theme.textTheme.bodyMedium?.color),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            hintText: t.enterTheNote,
            hintStyle: RobotoTextStyle.middle14.copyWith(color: theme.hoverColor),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.textTheme.bodyMedium?.color ?? AppColors.black),
              borderRadius: BorderRadius.circular(24.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.hoverColor),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ),
      ),
    );
  }
}
