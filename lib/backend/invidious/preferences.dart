import 'package:shared_preferences/shared_preferences.dart';

///This class represents the Invidious preferences
///It has a function that returns a map that will
///be encoded to JSON and then URL-encoded.
///https://docs.invidious.io/preferences/

class InvidiousPreferences {

  InvidiousPreferences();

  static Map<String, dynamic> preferences(SharedPreferences prefs) {
    Map<String, dynamic> config = {
      "listen": prefs.getBool('audioMode') ?? false,
      "quality": prefs.getString('videoQuality') ?? 'dash'
    };
    return config;
  }

}