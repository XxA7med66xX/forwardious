import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/play_next_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/show_related_vidoes_cubit.dart';
import 'package:forwardious/frontend/modules/switch_tile.dart';
import 'package:forwardious/i18n/strings.g.dart';

class ShowRelatedVideos extends StatelessWidget {
  const ShowRelatedVideos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayNextCubit, bool>(
      builder: (context, state) {
        return SwitchTile.sub(
          title: context.t.settingsScreen.invidiousPreferences.relatedVideos,
          value: context.watch<ShowRelatedVideosCubit>().isRelatedVideos,
          onChanged: (value) {
            if (value) {
              context.read<ShowRelatedVideosCubit>().enable();
            } else {
              context.read<ShowRelatedVideosCubit>().disable();
            }
          },
        );
      },
    );
  }
}