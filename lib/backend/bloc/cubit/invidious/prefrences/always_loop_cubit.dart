import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlwaysLoopCubit extends Cubit<bool> {
  AlwaysLoopCubit(this.prefs) : super(false);

  final SharedPreferences prefs;
  late bool isAlwaysLoop = prefs.getBool('alwaysLoop')?? false;
  
  void enable() {

    isAlwaysLoop = true;

    prefs.setBool('alwaysLoop', true);

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
    
    isAlwaysLoop = false;

    prefs.setBool('alwaysLoop', false);

    ChromeCookies.override(
      'PREFS',
      '${prefs.getString('currentInstance')!}/preferences',
      Uri.encodeComponent(jsonEncode(InvidiousPreferences.preferences(prefs))),
    );

    emit(false);
  }
}