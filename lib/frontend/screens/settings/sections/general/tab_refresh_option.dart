import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/chrome_settings/tab_refresh_cubit.dart';
import 'package:forwardious/frontend/modules/option_card.dart';
import 'package:forwardious/frontend/modules/popup_menu_button.dart';
import 'package:forwardious/i18n/strings.g.dart';

class TabRefreshOption extends StatelessWidget {
  const TabRefreshOption({super.key});

  @override
  Widget build(BuildContext context) {
    
    final tabRefreshCubit = context.read<TabRefreshCubit>();
    // Rebuild wordsMap to ensure getting the latest translations
    tabRefreshCubit.buildWordMap(context);

    return OptionCard(
      title: Text(context.t.settingsScreen.tabRefreshBehaviour),
      subtitle: Text(context.t.settingsScreen.tabBehaviourWhenOpeningaYoutubeUrl),
      trailing: BlocBuilder<TabRefreshCubit, String>(
        builder: (context, state) {
          return PopupMenu(
            initialValue: context.watch<TabRefreshCubit>().selectedItem,
            onSelected: (value) {
              context.read<TabRefreshCubit>().selected(value);
            },
            itemBuilder: (context) {
              return tabRefreshCubit.wordMap.entries.map((e) {
                return PopupMenuItem(value: e.key,child: Text(e.value));
              }).toList();
            },
            selectedItem: context.watch<TabRefreshCubit>().getSelectedValue(context),
          );
        },
      ),
    );
  }
}
