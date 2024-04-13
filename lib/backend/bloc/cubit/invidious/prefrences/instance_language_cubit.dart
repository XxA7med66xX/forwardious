import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstanceLanguageCubit extends Cubit<String> {
  InstanceLanguageCubit(this.prefs) : super('en-US');

  final SharedPreferences prefs;

  late String selectedItem = prefs.getString('InstanceLocaleName') ?? 'English';

  void selected(String item) {

    final index = languageNames.indexWhere((langName) => langName == item);
    
    selectedItem = item;

    prefs.setString('InstanceLocaleName', item);

    prefs.setString('InstanceLocaleCode', languageCodes[index]);

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

  final List<String> languageNames = [
    'العربية',
    'বাংলা',
    'Català',
    'Čeština',
    'Dansk',
    'Deutsch',
    'Ελληνικά',
    'English',
    'Esperanto',
    'Español',
    'Eesti keel',
    'Euskara',
    'فارسی',
    'Suomi',
    'Français',
    'עברית',
    'हिन्दी',
    'Hrvatski',
    'Magyar Nyelv',
    'Bahasa Indonesia',
    'Íslenska',
    'Italiano',
    '日本語',
    '한국어',
    'Lietuvių',
    'Norsk bokmål',
    'Nederlands',
    'Polski',
    'Português',
    'Português Brasileiro',
    'Português de Portugal',
    'Română',
    'Русский',
    'සිංහල',
    'Slovenčina',
    'Slovenščina',
    'Shqip',
    'Srpski (latinica)',
    'Српски (ћирилица)',
    'Svenska',
    'Türkçe',
    'Українська',
    'Tiếng Việt',
    '汉语',
    '漢語'
  ];

  final List<String> languageCodes = [
    'ar',
    'bn',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en-US',
    'eo',
    'es',
    'et',
    'eu',
    'fa',
    'fi',
    'fr',
    'he',
    'hi',
    'hr',
    'hu-HU',
    'id',
    'is',
    'it',
    'ja',
    'ko',
    'lt',
    'nb-NO',
    'nl',
    'pl',
    'pt',
    'pt-BR',
    'pt-PT',
    'ro',
    'ru',
    'si',
    'sk',
    'sl',
    'sq',
    'sr',
    'sr_Cyrl',
    'sv-SE',
    'tr',
    'uk',
    'vi',
    'zh-CN',
    'zh-TW'
  ];
}
