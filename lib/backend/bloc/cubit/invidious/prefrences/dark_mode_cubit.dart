import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeCubit extends Cubit<bool> {
  DarkModeCubit(this.prefs) : super(false);

  final SharedPreferences prefs;

  late bool isDarkMode = prefs.getBool('isDarkMode') ?? true;

  enable() {
    isDarkMode = true;

    prefs.setBool('isDarkMode', true);

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

  disable() {
    isDarkMode = false;

    prefs.setBool('isDarkMode', false);

    ChromeCookies.override(
      //The name of the invidious cookies.
      'PREFS',
      //The targeted URL is the preferences URL of the current instance.
      '${prefs.getString('currentInstance')!}/preferences',
      //The preferences are encoded to JSON and then URL-encoded.
      Uri.encodeComponent(jsonEncode(InvidiousPreferences.preferences(prefs))),
    );

    emit(false);
  }
}