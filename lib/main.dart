import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/chrome_settings/tab_behaviour_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/always_loop_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/audio_mode_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/auto_play_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/default_captions_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/instance_language_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/play_next_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/player_style_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/speed_slider_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/thin_mode_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/video_quality_cubit.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/volume_slider_cubit.dart';
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
        BlocProvider(create: (context) => VideoQualityCubit(prefs)),
        BlocProvider(create: (context) => InstanceLanguageCubit(prefs)),
        BlocProvider(create: (context) => DefaultCaptionsCubit(prefs)),
        BlocProvider(create: (context) => AutoPlayCubit(prefs)),
        BlocProvider(create: (context) => AlwaysLoopCubit(prefs)),
        BlocProvider(create: (context) => PlayNextCubit(prefs)),
        BlocProvider(create: (context) => ThinModeCubit(prefs)),
        BlocProvider(create: (context) => VolumeSliderCubit(prefs)),
        BlocProvider(create: (context) => SpeedSliderCubit(prefs)),
        BlocProvider(create: (context) => PlayerStyleCubit(prefs)),
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
