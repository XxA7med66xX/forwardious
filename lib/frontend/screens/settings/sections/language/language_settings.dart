import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/language_cubit.dart';
import 'package:forwardious/frontend/modules/option_card.dart';
import 'package:forwardious/frontend/modules/section_title.dart';
import 'package:forwardious/frontend/modules/slide_transaction.dart';
import 'package:forwardious/frontend/screens/settings/sections/language/select_lang_screen.dart';
import 'package:forwardious/i18n/strings.g.dart';

class LanguageSettings extends StatelessWidget {
  const LanguageSettings({super.key});

  @override
  Widget build(BuildContext context) {

    final direction = context.watch<LanguageCubit>().direction;

    return Column(
      children: [
        SectionTitle(title: context.t.settingsScreen.language),

        OptionCard(
          title: Text(context.t.settingsScreen.setTheAppLanguage),
          trailing: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                Tranaction(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return BlocBuilder<LanguageCubit, AppLocale>(
                      builder: (context, state) {
                        return Directionality(
                          //The current direction value comes from
                          //the Language cubit,depending on the
                          //selected language,If the selected language
                          //is RTL, it will be changed directly to RTL,
                          //and so on.
                          textDirection: direction,
                          child: const SelectLanguageScreen(),
                        );
                      },
                    );
                  },
                ).slideTransaction(direction),
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            child: Text(context.t.locale),
          ),
        ),
      ],
    );
  }
}
