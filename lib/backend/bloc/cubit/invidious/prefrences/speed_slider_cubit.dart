import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpeedSliderCubit extends Cubit<double> {
  SpeedSliderCubit(this.prefs) : super(1.0);

  final SharedPreferences prefs;

  late double sliderValue = prefs.getDouble('speedSliderValue') ?? 1.0;

  void increase(double value) {
    sliderValue = value;
    prefs.setDouble('speedSliderValue', value);

    emit(value);
  }

  void setSpeed() {
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
