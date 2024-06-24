import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/language_cubit.dart';
import 'package:forwardious/frontend/modules/custom_flat_button.dart';
import 'package:forwardious/i18n/strings.g.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [

              CustomFlatButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                tooltip: context.t.settingsScreen.back,
              ),

              const SizedBox(width: 10),

              Text(
                context.t.settingsScreen.language,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: AppLocaleUtils.supportedLocales.length,
              itemBuilder: (context, index) {
                return LangugageCard(
                  //It will take the language name from the [Locale] value 
                  //that was generated from the [strings.i18n.json] files by 
                  //the slang lib.
                  languageName: AppLocale.values[index].translations.locale,
                  onPressed: () {

                    //set language by it's code
                    context.read<LanguageCubit>().setLangugae(
                          AppLocaleUtils.supportedLocales[index].toString(),);

                    //After changing the language, this function
                    //changes the direction of the screen.
                    context.read<LanguageCubit>().changeDirection();

                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LangugageCard extends StatelessWidget {

  ///This is a simple card that represents
  ///the language name when choosing from
  ///the list of languages.
  const LangugageCard({
    super.key,
    required this.languageName,
    required this.onPressed,
  });

  final String languageName;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              languageName,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
