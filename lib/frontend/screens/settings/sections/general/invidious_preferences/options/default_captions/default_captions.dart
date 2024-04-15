import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/language_cubit.dart';
import 'package:forwardious/frontend/modules/option_card.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/default_captions/first_caption.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/default_captions/second_caption.dart';
import 'package:forwardious/frontend/screens/settings/sections/general/invidious_preferences/options/default_captions/third_caption.dart';
import 'package:forwardious/i18n/strings.g.dart';

class DefaultCaptions extends StatelessWidget {
  const DefaultCaptions({super.key});

  @override
  Widget build(BuildContext context) {
    final direction = context.watch<LanguageCubit>().direction;

    return OptionCard.sub(
      isButton: true,
      onTap: () {
        showDialog_(context, direction);
      },
      title: Text(context.t.settingsScreen.invidiousPreferences.defaultCaptions.defaultCaptions),
      trailing: const Icon(Icons.closed_caption),
    );
  }

  Future<dynamic> showDialog_(BuildContext context, TextDirection direction) {
    return showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: direction,
          child: Dialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(context.t.settingsScreen.invidiousPreferences.defaultCaptions.first),
                  const FirstCaptionSelector(),
                  Text(context.t.settingsScreen.invidiousPreferences.defaultCaptions.second),
                  const SecondCaptionSelector(),
                  Text(context.t.settingsScreen.invidiousPreferences.defaultCaptions.third),
                  const ThirdCaptionSelector(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
