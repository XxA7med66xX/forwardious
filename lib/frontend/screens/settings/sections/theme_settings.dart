import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/theme_cubit.dart';
import 'package:forwardious/frontend/modules/section_title.dart';
import 'package:forwardious/frontend/modules/switch_tile.dart';
import 'package:forwardious/i18n/strings.g.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SectionTitle(title: context.t.settingsScreen.theme),

        BlocBuilder<ThemeCubit, bool>(
          builder: (context, state) {

            final themeMode = context.watch<ThemeCubit>().prefs.getBool('themeMode') ?? false;
            final themeCubit = context.read<ThemeCubit>();

            return SwitchTile(
              title: context.t.settingsScreen.darkMode,
              subtitle: context.t.settingsScreen.setDarkModeTheme,
              value: themeMode,
              onChanged: (value) {
                if (value) {
                  themeCubit.isDarkMode();
                } else {
                  themeCubit.isLightMode();
                }
              },
            );
          },
        ),
      ],
    );
  }
}
