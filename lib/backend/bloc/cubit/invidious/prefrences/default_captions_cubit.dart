import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/cookies/cookies.dart';
import 'package:forwardious/backend/invidious/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultCaptionsCubit extends Cubit<String> {
  DefaultCaptionsCubit(this.prefs) : super('none');

  final SharedPreferences prefs;

  //The selected captions of all of the three selectors
  late String selectedCaption_1 = prefs.getString('caption1') ?? 'none';
  late String selectedCaption_2 = prefs.getString('caption2') ?? 'none';
  late String selectedCaption_3 = prefs.getString('caption3') ?? 'none';

  ///The captionNum parameter is used to detect
  ///from what selector this function is called.
  ///'first','second','third'
  void selected(String item, String captionNum) {
    
    final index = languageCodes.indexWhere((langCode) => langCode == item);
    final languageName = languageNames[index];

    //This list retrieves saved values as a list
    //these values are used to set the 'captions' key
    //in Invidious cookies the 'captions' key represents
    //combinations of language name and accent type enclosed
    //in parentheses. For example 'Arabic (Yemen)'.

    late List<String> captionsList = {
      'first': prefs.getString('selectedCaptionCode_1') ?? 'none',
      'second': prefs.getString('selectedCaptionCode_2') ?? 'none',
      'third': prefs.getString('selectedCaptionCode_3') ?? 'none',
    }.values.toList();

    //Check [captionNum] value to determine the
    //correct excution foreach one.

    switch (captionNum) {
      case 'first':
        selectedCaption_1 = languageName;
        prefs.setString('caption1', languageName);
        prefs.setString('selectedCaptionCode_1', item);
      case 'second':
        selectedCaption_2 = languageName;
        prefs.setString('caption2', languageName);
        prefs.setString('selectedCaptionCode_2', item);
      case 'third':
        selectedCaption_3 = languageName;
        prefs.setString('caption3', languageName);
        prefs.setString('selectedCaptionCode_3', item);
    }

    prefs.setStringList('captions', captionsList);

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

  final languageNames = [
    'none',
    'Afrikaans',
    'Albanian',
    'Amharic',
    'Arabic',
    'Armenian',
    'Azerbaijani',
    'Bangla',
    'Basque',
    'Belarusian',
    'Bosnian',
    'Bulgarian',
    'Burmese',
    'Cantonese',
    'Catalan',
    'Cebuano',
    'Chinese',
    'Chinese',
    'Chinese',
    'Chinese',
    'Chinese',
    'Chinese',
    'Corsican',
    'Croatian',
    'Czech',
    'Danish',
    'Dutch',
    'Dutch',
    'English',
    'English',
    'English',
    'English',
    'Esperanto',
    'Estonian',
    'Finnish',
    'Filipino',
    'French',
    'French',
    'Galician',
    'Georgian',
    'German',
    'German',
    'Greek',
    'Gujarati',
    'Haitian Creole',
    'Hausa',
    'Hawaiian',
    'Hebrew',
    'Hindi',
    'Hmong',
    'Hungarian',
    'Icelandic',
    'Igbo',
    'Indonesian',
    'Indonesian',
    'Interlingue',
    'Irish',
    'Italian',
    'Italian',
    'Japanese',
    'Japanese',
    'Javanese',
    'Kannada',
    'Kazakh',
    'Khmer',
    'Korean',
    'Korean',
    'Kurdish',
    'Kyrgyz',
    'Lao',
    'Latin',
    'Latvian',
    'Lithuanian',
    'Luxembourgish',
    'Macedonian',
    'Malagasy',
    'Malay',
    'Malayalam',
    'Maltese',
    'Maori',
    'Marathi',
    'Mongolian',
    'Nepali',
    'Norwegian Bokmål',
    'Nyanja',
    'Pashto',
    'Persian',
    'Polish',
    'Portuguese',
    'Portuguese',
    'Portuguese',
    'Punjabi',
    'Romanian',
    'Russian',
    'Russian',
    'Samoan',
    'Scottish Gaelic',
    'Serbian',
    'Shona',
    'Sindhi',
    'Sinhala',
    'Slovak',
    'Slovenian',
    'Somali',
    'Southern Sotho',
    'Spanish',
    'Spanish',
    'Spanish',
    'Spanish',
    'Spanish',
    'Sundanese',
    'Swahili',
    'Swedish',
    'Tajik',
    'Tamil',
    'Telugu',
    'Thai',
    'Turkish',
    'Turkish',
    'Ukrainian',
    'Urdu',
    'Uzbek',
    'Vietnamese',
    'Vietnamese',
    'Welsh',
    'Western Frisian',
    'Xhosa',
    'Yiddish',
    'Yoruba',
    'Zulu'
  ];

  final languageCodes = [
    'none',
    'Afrikaans',
    'Albanian',
    'Amharic',
    'Arabic',
    'Armenian',
    'Azerbaijani',
    'Bangla',
    'Basque',
    'Belarusian',
    'Bosnian',
    'Bulgarian',
    'Burmese',
    'Cantonese (Hong Kong)',
    'Catalan',
    'Cebuano',
    'Chinese',
    'Chinese (China)',
    'Chinese (Hong Kong)',
    'Chinese (Simplified)',
    'Chinese (Taiwan)',
    'Chinese (Traditional)',
    'Corsican',
    'Croatian',
    'Czech',
    'Danish',
    'Dutch',
    'Dutch (auto-generated)',
    'English',
    'English (United Kingdom)',
    'English (United States)',
    'English (auto-generated)',
    'Esperanto',
    'Estonian',
    'Finnish',
    'Filipino',
    'French',
    'French (auto-generated)',
    'Galician',
    'Georgian',
    'German',
    'German (auto-generated)',
    'Greek',
    'Gujarati',
    'Haitian Creole',
    'Hausa',
    'Hawaiian',
    'Hebrew',
    'Hindi',
    'Hmong',
    'Hungarian',
    'Icelandic',
    'Igbo',
    'Indonesian',
    'Indonesian (auto-generated)',
    'Interlingue',
    'Irish',
    'Italian',
    'Italian (auto-generated)',
    'Japanese',
    'Japanese (auto-generated)',
    'Javanese',
    'Kannada',
    'Kazakh',
    'Khmer',
    'Korean',
    'Korean (auto-generated)',
    'Kurdish',
    'Kyrgyz',
    'Lao',
    'Latin',
    'Latvian',
    'Lithuanian',
    'Luxembourgish',
    'Macedonian',
    'Malagasy',
    'Malay',
    'Malayalam',
    'Maltese',
    'Maori',
    'Marathi',
    'Mongolian',
    'Nepali',
    'Norwegian Bokmål',
    'Nyanja',
    'Pashto',
    'Persian',
    'Polish',
    'Portuguese',
    'Portuguese (Brazil)',
    'Portuguese (auto-generated)',
    'Punjabi',
    'Romanian',
    'Russian',
    'Russian (auto-generated)',
    'Samoan',
    'Scottish Gaelic',
    'Serbian',
    'Shona',
    'Sindhi',
    'Sinhala',
    'Slovak',
    'Slovenian',
    'Somali',
    'Southern Sotho',
    'Spanish',
    'Spanish (Latin America)',
    'Spanish (Mexico)',
    'Spanish (Spain)',
    'Spanish (auto-generated)',
    'Sundanese',
    'Swahili',
    'Swedish',
    'Tajik',
    'Tamil',
    'Telugu',
    'Thai',
    'Turkish',
    'Turkish (auto-generated)',
    'Ukrainian',
    'Urdu',
    'Uzbek',
    'Vietnamese',
    'Vietnamese (auto-generated)',
    'Welsh',
    'Western Frisian',
    'Xhosa',
    'Yiddish',
    'Yoruba',
    'Zulu'
  ];
}
