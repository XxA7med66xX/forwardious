import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/language_cubit.dart';
import 'package:forwardious/frontend/screens/settings/appbar.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/general.dart';
import 'package:forwardious/frontend/screens/settings/sections/language/language_settings.dart';
import 'package:forwardious/frontend/screens/settings/sections/theme_settings.dart';
import 'package:forwardious/i18n/strings.g.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: BlocBuilder<LanguageCubit, AppLocale>(
          builder: (context, state) {
            final direction = context.watch<LanguageCubit>().direction;
            return Directionality(
              textDirection: direction,
              child: const Column(
                children: [
                  SettingsAppbar(),
                  GeneralSettings(),
                  ThemeSettings(),
                  LanguageSettings()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
