import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/speed_slider_cubit.dart';
import 'package:forwardious/frontend/modules/slider.dart';
import 'package:forwardious/i18n/strings.g.dart';

class SpeedSlider extends StatelessWidget {
  const SpeedSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeedSliderCubit, double>(
      builder: (context, state) {
        return CustomSlider.sub(
          title: context.t.settingsScreen.invidiousPreferences.speed,
          divisions: 3,
          label: '${context.watch<SpeedSliderCubit>().sliderValue}',
          toolTip: context.t.settingsScreen.invidiousPreferences.speedToolTip,
          min: 0.5,
          max: 2.0,
          value: context.watch<SpeedSliderCubit>().sliderValue,
          onChanged: (value) {
            context.read<SpeedSliderCubit>().increase(value);
          },
          onChangeEnd: (value) {
            context.read<SpeedSliderCubit>().setSpeed();
          },
        );
      },
    );
  }
}
