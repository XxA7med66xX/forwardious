import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioModeCubit extends Cubit<bool> {
  AudioModeCubit(this.prefs) : super(false);

  final SharedPreferences prefs;
  late bool isAudioMode = prefs.getBool('audioMode')?? false;
  
  void enable() {

    isAudioMode = true;

    prefs.setBool('audioMode', true);

    ChromeCookies.override(
      //The name of the invidious cookies.
      'PREFS',
      //The targeted URL is the preferences URL of the current instance.
      '${prefs.getString('currentInstance')!}/preferences',
      //The preferences are encoded to JSON and then URL-encoded.
      Uri.encodeComponent(jsonEncode(InvidiousPreferences.preferences(prefs))),
    );
    
    emit(true);
  }

  void disable() {
    
    isAudioMode = false;

    prefs.setBool('audioMode', false);

    ChromeCookies.override(
      'PREFS',
      '${prefs.getString('currentInstance')!}/preferences',
      Uri.encodeComponent(jsonEncode(InvidiousPreferences.preferences(prefs))),
    );

    emit(false);
  }
}