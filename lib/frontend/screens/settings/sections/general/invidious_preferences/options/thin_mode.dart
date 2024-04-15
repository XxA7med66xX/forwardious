import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/play_next_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/thin_mode_cubit.dart';
import 'package:forwardious/frontend/modules/switch_tile.dart';
import 'package:forwardious/i18n/strings.g.dart';

class ThinMode extends StatelessWidget {
  const ThinMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayNextCubit, bool>(
      builder: (context, state) {
        return SwitchTile.sub(
          title: context.t.settingsScreen.invidiousPreferences.thinMode,
          subtitle: context.t.settingsScreen.invidiousPreferences.thinModeSubtitle,
          value: context.watch<ThinModeCubit>().isThinMode,
          onChanged: (value) {
            if (value) {
              context.read<ThinModeCubit>().enable();
            } else {
              context.read<ThinModeCubit>().disable();
            }
          },
        );
      },
    );
  }
}
