import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/chrome_settings/tab_behaviour_cubit.dart';
import 'package:forwardious/backend/chrome_api/storage/chrome_storage.dart';
import 'package:forwardious/frontend/modules/option_card.dart';
import 'package:forwardious/frontend/modules/popup_menu_button.dart';
import 'package:forwardious/i18n/strings.g.dart';

class TabRefreshOption extends StatelessWidget {
  const TabRefreshOption({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionCard(
      title: Text(context.t.settingsScreen.tabRefreshBehaviour),
      subtitle: Text(context.t.settingsScreen.tabBehaviourWhenOpeningaYoutubeUrl),
      trailing: BlocBuilder<TabRefreshCubit, String>(
        builder: (context, state) {
          return PopupMenu(
            initialValue: context.watch<TabRefreshCubit>().selected,
            //When the value is ['RemoveTab'], it means that Chrome
            //will remove the tab once you open a YouTube URL
            //and create another tab with the Invidious instance.
            //If the value is ['UpdateTab'],it will just update the current tab.
            //I set the value as true in the Chrome storage using
            //the Chrome API so that I can use these values in the
            //background.dart.js file.
            onSelected: (value) {
              if (value == 'RemoveTab') {
                ChromeStorage.save({'tabMode': true});
                context.read<TabRefreshCubit>().removeTab();
              } else {
                ChromeStorage.save({'tabMode': false});
                context.read<TabRefreshCubit>().updateTab();
              }
            },

            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'RemoveTab',
                  child: Text(t.settingsScreen.removeTab),
                ),
                PopupMenuItem(
                  value: 'UpdateTab',
                  child: Text(t.settingsScreen.updateTab),
                ),
              ];
            },

            selectedItem: context.watch<TabRefreshCubit>().selected!,
          );
        },
      ),
    );
  }
}
