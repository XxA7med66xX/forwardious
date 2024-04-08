import 'package:forwardious/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Locale {

  ///Initialize the current language by its
  ///code,which is saved in [SharedPreferences].
  ///If it's null, the default language set in the
  ///browser will be used (if available in supported
  ///locales),If not,the default language will be set
  ///to English.

  static AppLocale init(SharedPreferences prefs) {
    final String? langCode = prefs.getString('langCode');

    return langCode == null
        ? LocaleSettings.useDeviceLocale()
        : LocaleSettings.setLocaleRaw(langCode);
  }
}
