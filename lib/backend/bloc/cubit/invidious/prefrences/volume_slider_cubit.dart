import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VolumeSliderCubit extends Cubit<double> {
  VolumeSliderCubit(this.prefs) : super(0);

  final SharedPreferences prefs;

  late double sliderValue = prefs.getDouble('volSliderValue') ?? 100.0;

  late int selectedVol = prefs.getInt('selectedVol') ?? 100;

  //The sliderLable takes it's value from the slider value it self but as int
  late int sliderLabel = prefs.getDouble('volSliderValue')?.toInt() ?? 0;

  void increase(double value) {
    sliderValue = value;
    sliderLabel = value.toInt();
    prefs.setDouble('volSliderValue', value);

    emit(value);
  }

  void setVolume() {
    prefs.setInt('selectedVol', sliderValue.toInt());

    ChromeCookies.override(
      //The name of the invidious cookies.
      'PREFS',
      //The targeted URL is the preferences URL of the current instance.
      '${prefs.getString('currentInstance')!}/preferences',
      //The preferences are encoded to JSON and then URL-encoded.
      Uri.encodeComponent(jsonEncode(InvidiousPreferences.preferences(prefs))),
    );
  }
}
