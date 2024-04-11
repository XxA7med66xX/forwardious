import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/language_cubit.dart';
import 'package:forwardious/frontend/modules/option_card.dart';
import 'package:forwardious/frontend/modules/slide_transaction.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/preferences_screen.dart';
import 'package:forwardious/i18n/strings.g.dart';

class InvidiousPrefrencesOption extends StatelessWidget {
  const InvidiousPrefrencesOption({super.key});

  @override
  Widget build(BuildContext context) {
    
    final direction = context.watch<LanguageCubit>().direction;

    return BlocBuilder<LanguageCubit, AppLocale>(
      builder: (context, state) {
        return OptionCard.sub(
          title: Text(context.t.settingsScreen.invidiousPreferences.invidiousPreferences),
          trailing: const Icon(Icons.video_settings),
          isButton: true,
          onTap: () {
            Navigator.of(context).push(
              Tranaction(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Directionality(
                    textDirection: direction,
                    child: const InvidiousPreferencesScreen(),
                  );
                },
              ).slideTransaction(direction),
            );
          },
        );
      },
    );
  }
}
