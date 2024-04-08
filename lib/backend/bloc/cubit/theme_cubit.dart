import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit(this.prefs) : super(false);

  bool? themeMode;
  final SharedPreferences prefs;
  
  ///I use [SharedPreferences] to save the value of the theme in storage.
  void isLightMode() {
    prefs.setBool('themeMode', false);
    emit(false);
  }
  
  void isDarkMode() {
    prefs.setBool('themeMode', true);
    emit(true);
  }
}
