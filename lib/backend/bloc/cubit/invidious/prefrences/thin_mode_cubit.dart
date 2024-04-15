import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThinModeCubit extends Cubit<bool> {
  ThinModeCubit(this.prefs) : super(false);

  final SharedPreferences prefs;

  late bool isThinMode = prefs.getBool('thinMode') ?? false;

  enable() {
    isThinMode = true;

    prefs.setBool('thinMode', true);

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
    isThinMode = false;

    prefs.setBool('thinMode', false);

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
