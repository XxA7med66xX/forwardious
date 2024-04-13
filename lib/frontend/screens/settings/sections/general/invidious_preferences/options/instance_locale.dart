import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious/prefrences/instance_language_cubit.dart';
import 'package:forwardious/frontend/modules/option_card.dart';
import 'package:forwardious/frontend/modules/popup_menu_button.dart';
import 'package:forwardious/i18n/strings.g.dart';

class InstanceLocale extends StatelessWidget {
  const InstanceLocale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    final languageNames = context.watch<InstanceLanguageCubit>().languageNames;

    return BlocBuilder<InstanceLanguageCubit, String>(
      builder: (context, state) {
        return OptionCard.sub(
          title: Text(context.t.settingsScreen.invidiousPreferences.interfaceLocale),
          trailing: PopupMenu(
            initialValue: context.watch<InstanceLanguageCubit>().selectedItem,
            onSelected: (value) {
              context.read<InstanceLanguageCubit>().selected(value);
            },
            itemBuilder: (context) {
              return languageNames.map(
                (langName) {

                  final index = languageNames.indexWhere((name) => name == langName);

                  return PopupMenuItem(
                    value: langName,
                    child: Text(languageNames[index]),
                  );

                },
              ).toList();
            },
            selectedItem: context.watch<InstanceLanguageCubit>().selectedItem,
          ),
        );
      },
    );
  }
}
