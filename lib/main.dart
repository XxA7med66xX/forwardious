import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/chrome_settings/tab_behaviour_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/audio_mode_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/language_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/theme_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/radio_button_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious_instance_cubit.dart';
import 'package:forwardious/frontend/screens/home/home.dart';
import 'package:forwardious/frontend/screens/settings/settings.dart';
import 'package:forwardious/frontend/theme/theme.dart';
import 'package:forwardious/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'i18n/init_locale.dart' as locale;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  //Initialize sharedsreferences
  final prefs = await SharedPreferences.getInstance();

  //Initialize locale
  locale.Locale.init(prefs);

  runApp(TranslationProvider(child: MainApp(prefs: prefs)));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InvidiousInstanceCubit(prefs)),
        BlocProvider(create: (context) =>SelectInstanceRadioButtonCubit(InvidiousInstanceCubit(prefs))),
        BlocProvider(create: (context) => ThemeCubit(prefs)),
        BlocProvider(create: (context) => LanguageCubit(prefs)),
        BlocProvider(create: (context) => TabRefreshCubit(prefs)),
        BlocProvider(create: (context) => AudioModeCubit(prefs)),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          //Theme mode [true] means dark theme enabled, [false] is light theme.
          final thememode = prefs.getBool('themeMode') ?? false;
          //The screen direction [RTL] or [LTR].
          final direction = context.watch<LanguageCubit>().direction;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {'settings': (context) => const SettingsScreen()},
            theme: thememode ? AppTheme.darkMode : AppTheme.lightMode,
            home: BlocBuilder<LanguageCubit, AppLocale>(
              builder: (context, state) {
                return Directionality(
                  textDirection: direction,
                  child: HomeScreen(prefs: prefs),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
