import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/default_homepage_cubit.dart';
import 'package:forwardious/frontend/modules/option_card.dart';
import 'package:forwardious/frontend/modules/popup_menu_button.dart';
import 'package:forwardious/i18n/strings.g.dart';

class DefaultHomePage extends StatelessWidget {
  const DefaultHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    // Rebuild wordsMap to ensure getting the latest translations
    context.read<DefaultHomePageCubit>().buildWordsMap(context);

    return BlocBuilder<DefaultHomePageCubit, String>(
      builder: (context, state) {
        return OptionCard.sub(
          title: Text(context.t.settingsScreen.invidiousPreferences.defaultHome),
          trailing: PopupMenu(
            initialValue: context.read<DefaultHomePageCubit>().selectedItem,
            onSelected: (value) {
              context.read<DefaultHomePageCubit>().selected(value);
            },
            itemBuilder: (context) {
              return context.read<DefaultHomePageCubit>().wordsMap.entries.map((entry) {
                return PopupMenuItem(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList();
            },
            selectedItem: context.read<DefaultHomePageCubit>().getSelectedItemName(context),
          ),
        );
      },
    );
  }
}
