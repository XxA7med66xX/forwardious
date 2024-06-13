import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/dark_mode_cubit.dart';
import 'package:forwardious/frontend/modules/switch_tile.dart';
import 'package:forwardious/i18n/strings.g.dart';

class DarkMode extends StatelessWidget {
  const DarkMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, bool>(
      builder: (context, state) {
        return SwitchTile.sub(
          title: context.t.settingsScreen.invidiousPreferences.darkMode,
          value: context.watch<DarkModeCubit>().isDarkMode,
          onChanged: (value) {
            if (value) {
              context.read<DarkModeCubit>().enable();
            } else {
              context.read<DarkModeCubit>().disable();
            }
          },
        );
      },
    );
  }
}