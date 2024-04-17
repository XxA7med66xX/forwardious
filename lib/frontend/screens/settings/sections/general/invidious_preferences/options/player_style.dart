import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/player_style_cubit.dart';
import 'package:forwardious/frontend/modules/option_card.dart';
import 'package:forwardious/frontend/modules/popup_menu_button.dart';
import 'package:forwardious/i18n/strings.g.dart';

class PlayerStyle extends StatelessWidget {
  const PlayerStyle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final String selectedItem = context.watch<PlayerStyleCubit>().selectedItem;

    return BlocBuilder<PlayerStyleCubit, String>(
      builder: (context, state) {
        return OptionCard.sub(
          title: Text(context.t.settingsScreen.invidiousPreferences.playerStyle),
          subtitle: Text(context.t.settingsScreen.invidiousPreferences.playerStyleSubtitle),
          trailing: PopupMenu(
            initialValue: selectedItem,
            onSelected: (value) {
              context.read<PlayerStyleCubit>().selected(value);
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: 'invidious',
                  child: Text('invidious'),
                ),
                PopupMenuItem(
                  value: 'youtube',
                  child: Text('youtube'),
                )
              ];
            },
            selectedItem: selectedItem,
          ),
        );
      },
    );
  }
}
