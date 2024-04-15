import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/always_loop_cubit.dart';
import 'package:forwardious/frontend/modules/switch_tile.dart';
import 'package:forwardious/i18n/strings.g.dart';

class AlwaysLoop extends StatelessWidget {
  const AlwaysLoop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlwaysLoopCubit, bool>(
      builder: (context, state) {
        return SwitchTile.sub(
          title: context.t.settingsScreen.invidiousPreferences.alwaysLoop,
          subtitle: context.t.settingsScreen.invidiousPreferences.alwaysLoopSubtitle,
          value: context.watch<AlwaysLoopCubit>().isAlwaysLoop,
          onChanged: (value) {
            if (value) {
              context.read<AlwaysLoopCubit>().enable();
            } else {
              context.read<AlwaysLoopCubit>().disable();
            }
          },
        );
      },
    );
  }
}
