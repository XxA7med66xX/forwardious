import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerStyleCubit extends Cubit<String> {
  PlayerStyleCubit(this.prefs) : super('invidious');

  final SharedPreferences prefs;

  late String selectedItem = prefs.getString('playerStyle') ?? 'invidious';

  void selected(String item) {

    selectedItem = item;

    prefs.setString('playerStyle', item);

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
