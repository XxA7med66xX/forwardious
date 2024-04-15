import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/auto_play_cubit.dart';
import 'package:forwardious/frontend/modules/switch_tile.dart';
import 'package:forwardious/i18n/strings.g.dart';

class AutoPlay extends StatelessWidget {
  const AutoPlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoPlayCubit, bool>(
      builder: (context, state) {
        return SwitchTile(
          title: context.t.settingsScreen.invidiousPreferences.autoPlay,
          subtitle: context.t.settingsScreen.invidiousPreferences.autoPlaySubtitle,
          value: context.watch<AutoPlayCubit>().isAutoPlay,
          onChanged: (value) {
            if (value) {
              context.read<AutoPlayCubit>().enable();
            } else {
              context.read<AutoPlayCubit>().disable();
            }
          },
        );
      },
    );
  }
}
