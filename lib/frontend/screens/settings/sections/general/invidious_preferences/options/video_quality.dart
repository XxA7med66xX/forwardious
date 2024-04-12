import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/video_quality_cubit.dart';
import 'package:forwardious/frontend/modules/option_card.dart';
import 'package:forwardious/frontend/modules/popup_menu_button.dart';
import 'package:forwardious/i18n/strings.g.dart';

class VideoQuality extends StatelessWidget {
  const VideoQuality({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<VideoQualityCubit, String>(
      builder: (context, state) {
        return OptionCard.sub(
          title: Text(context.t.settingsScreen.invidiousPreferences.videoQuality),
          subtitle: Text(context.t.settingsScreen.invidiousPreferences.videoQualitySubtitle),
          trailing: PopupMenu(
            initialValue: context.watch<VideoQualityCubit>().selectedItem,
            onSelected: (value) {
              context.read<VideoQualityCubit>().selected(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'dash',
                  child: Text('DASH'),
                ),
                const PopupMenuItem(
                  value: 'hd720',
                  child: Text('HD720'),
                ),
                const PopupMenuItem(
                  value: 'medium',
                  child: Text('Medium'),
                ),
                const PopupMenuItem(
                  value: 'small',
                  child: Text('Small'),
                )
              ];
            },
            selectedItem: context.watch<VideoQualityCubit>().selectedItem,
          ),
        );
      },
    );
  }
}
