import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/volume_slider_cubit.dart';
import 'package:forwardious/frontend/modules/slider.dart';
import 'package:forwardious/i18n/strings.g.dart';

class VolumeSlider extends StatelessWidget {
  const VolumeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VolumeSliderCubit, double>(
      builder: (context, state) {
        return CustomSlider.sub(
          title: context.t.settingsScreen.invidiousPreferences.volume,
          divisions: 20,
          label: '${context.watch<VolumeSliderCubit>().sliderLabel}',
          toolTip: context.t.settingsScreen.invidiousPreferences.volumeToolTip,
          min: 0,
          max: 100,
          value: context.read<VolumeSliderCubit>().sliderValue,
          onChanged: (value) {
            context.read<VolumeSliderCubit>().increase(value);
          },
          onChangeEnd: (value) {
            context.read<VolumeSliderCubit>().setVolume();
          },
        );
      },
    );
  }
}
