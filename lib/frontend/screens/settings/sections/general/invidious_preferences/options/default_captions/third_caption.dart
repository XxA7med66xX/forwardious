import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/default_captions_cubit.dart';
import 'package:forwardious/frontend/modules/popup_menu_button.dart';
import 'package:forwardious/i18n/strings.g.dart';

class ThirdCaptionSelector extends StatelessWidget {
  const ThirdCaptionSelector({super.key});

  @override
  Widget build(BuildContext context) {

    final languageCodes = context.watch<DefaultCaptionsCubit>().languageCodes;

    final selectedCaption_3 = context.watch<DefaultCaptionsCubit>().selectedCaption_3 == 'none'
            ? context.t.settingsScreen.invidiousPreferences.defaultCaptions.none
            : context.watch<DefaultCaptionsCubit>().selectedCaption_3;

    return BlocBuilder<DefaultCaptionsCubit, String>(
      builder: (context, state) {
        return PopupMenu(
          initialValue: selectedCaption_3,
          onSelected: (value) {
            context.read<DefaultCaptionsCubit>().selected(value, 'third');
          },
          itemBuilder: (context) {

            //Create the menu items depending
            //on the length of languages codes
            //list and it's values.
        
            return languageCodes.map(
              (langCode) {
                return PopupMenuItem(
                  value: langCode,
                  child: Text(langCode),
                );
              },
            ).toList();
        
          },
          selectedItem: selectedCaption_3,
        );
      },
    );
  }
}
