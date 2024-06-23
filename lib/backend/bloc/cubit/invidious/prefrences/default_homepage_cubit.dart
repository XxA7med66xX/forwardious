import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:forwardious/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultHomePageCubit extends Cubit<String> {
  DefaultHomePageCubit(this.prefs) : super('');

  final SharedPreferences prefs;

  late String selectedItem = prefs.getString('default_homepage') ?? 'popular';

  // Map of language independent keys and their corresponding localized strings.
  late Map<String, String> wordsMap;

  void selected(String key) {
    selectedItem = key;
    prefs.setString('default_homepage', key);

    // Set the values that will be used in [InvidiousPreferences]
    if (key == 'search') {
      prefs.setString('default_homepage_prefs', '');
    } else if (key == 'popular') {
      prefs.setString('default_homepage_prefs', 'Popular');
    } else if (key == 'trending') {
      prefs.setString('default_homepage_prefs', 'Trending');
    }

    ChromeCookies.override(
      //The name of the invidious cookies.
      'PREFS',
      //The targeted URL is the preferences URL of the current instance.
      '${prefs.getString('currentInstance')!}/preferences',
      //The preferences are encoded to JSON and then URL-encoded.
      Uri.encodeComponent(jsonEncode(InvidiousPreferences.preferences(prefs))),
    );

    emit(key);
  }

  // Build a wordsMap with localized strings using the context
  void buildWordsMap(BuildContext context) {
    wordsMap = {
      'search': context.t.settingsScreen.invidiousPreferences.Search,
      'popular': context.t.settingsScreen.invidiousPreferences.Popular,
      'trending': context.t.settingsScreen.invidiousPreferences.Trending,
    };
    emit(selectedItem);
  }

  // Get localized item name using the key stored in selectedItem
  String getSelectedItemName(BuildContext context) {
    final String defaultValue = context.t.settingsScreen.invidiousPreferences.Popular;
    return wordsMap[selectedItem] ?? defaultValue;
  }
}
