import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/extensions.dart';
import 'package:forwardious/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<AppLocale> {
  LanguageCubit(this.prefs) : super(AppLocale.en);

  final SharedPreferences prefs;
  
  //Gets the text direction from [SharedPreferences] if available.
  late TextDirection direction = prefs.getString('textDirection')?.convert() ?? TextDirection.ltr;
  
  //Here is the code for all supported RTL languages
  //These values will be used to determine whether
  //the direction is RTL or LTR.
  final List<String> rtlLanguages = ['ar'];

  ///As the name suggests, it sets the language code
  ///in the [SharedPreferences] key. When the app is
  ///run, it retrieves that key to get the languages
  ///that have been set by the user.
  
  void setLangugae(String langCode) {
    prefs.setString("langCode", langCode);
    emit(LocaleSettings.setLocaleRaw(langCode));
  }

  ///Changes the text direction It loops through the rtl
  ///languages [List] to ensure that the current language
  ///is in the list. If it exists, the direction will be
  ///changed to [TextDirection.rtl]; otherwise, it will
  ///be set to [TextDirection.ltr].
  ///
  ///Note: When adding new RTL language support, must
  ///manually add its code to the [rtlLanguages] list.
  Future<void> changeDirection() async {
    for (String lang in rtlLanguages) {
      if (LocaleSettings.currentLocale.languageCode == lang) {
        prefs.setString('textDirection', 'rtl');
        direction = prefs.getString('textDirection')!.convert();
      } else {
        prefs.setString('textDirection', 'ltr');
        direction = prefs.getString('textDirection')!.convert();
      }
    }
  }
}
