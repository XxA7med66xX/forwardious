import 'package:shared_preferences/shared_preferences.dart';

///This class represents the Invidious preferences
///It has a function that returns a map that will
///be encoded to JSON and then URL-encoded.
///https://docs.invidious.io/preferences/

class InvidiousPreferences {

  InvidiousPreferences();

  static Map<String, dynamic> preferences(SharedPreferences prefs) {
    return {
      "listen": prefs.getBool('audioMode') ?? false,
      "quality": prefs.getString('videoQuality') ?? 'dash',
      "locale": prefs.getString('InstanceLocaleCode') ?? 'en-US',
      "captions": prefs.getStringList('captions') ?? ["","",""],
      "autoplay": prefs.getBool('autoPlay') ?? false,
      "video_loop": prefs.getBool('alwaysLoop') ?? false,
      "continue": prefs.getBool('playNext') ?? false,
      "thin_mode": prefs.getBool('thinMode') ?? false,
      "volume": prefs.getInt('selectedVol') ?? 100,
      "speed": prefs.getDouble('speedSliderValue') ?? 1.0,
      "player_style": prefs.getString('playerStyle') ?? 'invidious',
      "related_videos": prefs.getBool('relatedVideos') ?? true,
      "dark_mode": prefs.getBool('isDarkMode') ?? false,
    };
  }

}