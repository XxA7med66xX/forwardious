import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoQualityCubit extends Cubit<String> {
  VideoQualityCubit(this.prefs) : super('dash');

  final SharedPreferences prefs;

  late String selectedItem = prefs.getString('videoQuality') ?? 'dash';

  selected(String item) {

    selectedItem = item;

    prefs.setString('videoQuality', item);

    ChromeCookies.override(
      //The name of the invidious cookies.
      'PREFS',
      //The targeted URL is the preferences URL of the current instance.
      '${prefs.getString('currentInstance')!}/preferences',
      //The preferences are encoded to JSON and then URL-encoded.
      Uri.encodeComponent(jsonEncode(InvidiousPreferences.preferences(prefs))),
    );

    emit(item);
  }
}
