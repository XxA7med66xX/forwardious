import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/audio_mode_cubit.dart';
import 'package:forwardious/frontend/modules/switch_tile.dart';
import 'package:forwardious/i18n/strings.g.dart';

class AudioMode extends StatelessWidget {
  const AudioMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioModeCubit, bool>(
      builder: (context, state) {
        return SwitchTile(
          title: context.t.settingsScreen.invidiousPreferences.audioMode,
          subtitle: context.t.settingsScreen.invidiousPreferences.audioModeSubtitle,
          value: context.watch<AudioModeCubit>().isAudioMode,
          onChanged: (value) {
            if (value) {
              context.read<AudioModeCubit>().enable();
            } else {
              context.read<AudioModeCubit>().disable();
            }
          },
        );
      },
    );
  }
}
