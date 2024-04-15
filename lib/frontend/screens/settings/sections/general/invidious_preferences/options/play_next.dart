import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/play_next_cubit.dart';
import 'package:forwardious/frontend/modules/switch_tile.dart';
import 'package:forwardious/i18n/strings.g.dart';

class PlayNext extends StatelessWidget {
  const PlayNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayNextCubit, bool>(
      builder: (context, state) {
        return SwitchTile.sub(
          title: context.t.settingsScreen.invidiousPreferences.playNext,
          subtitle: context.t.settingsScreen.invidiousPreferences.playNextSubtitle,
          value: context.watch<PlayNextCubit>().isPlayNext,
          onChanged: (value) {
            if (value) {
              context.read<PlayNextCubit>().enable();
            } else {
              context.read<PlayNextCubit>().disable();
            }
          },
        );
      },
    );
  }
}
