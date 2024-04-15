import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutoPlayCubit extends Cubit<bool> {
  AutoPlayCubit(this.prefs) : super(false);

  final SharedPreferences prefs;

  late bool isAutoPlay = prefs.getBool('autoPlay') ?? false;

  enable() {
    isAutoPlay = true;

    prefs.setBool('autoPlay', true);

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
    isAutoPlay = false;

    prefs.setBool('autoPlay', false);

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
