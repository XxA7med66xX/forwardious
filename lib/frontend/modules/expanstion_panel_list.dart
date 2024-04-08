import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/radio_button_cubit.dart';
import 'package:forwardious/backend/extensions.dart';
// import 'package:forwardious/backend/chrome_api/storage.dart';
import 'package:forwardious/frontend/modules/data_table.dart';
import 'package:forwardious/i18n/strings.g.dart';

class ExpanstionList extends StatelessWidget {
    ExpanstionList({
    super.key,
    required this.flag,
    required String url,
    required this.location,
    required this.type,
    required String health,
    required String signUp,
    required this.index,
    required this.locale,
    required this.instances, 
  }) : 
    url = url.adjustUrl(),
    health = health == ''? '-' : health,
    signUp = signUp == 'true'? '✅' : '❌';

  final String flag;
  final String url;
  final String location;
  final String type;
  final String health;
  final String signUp;
  final int index;
  final List<String> instances;
  final Translations locale;

  @override
  Widget build(BuildContext context) {
    final radioButtonCubit = context.watch<SelectInstanceRadioButtonCubit>();

    return Row(
      children: [
        Expanded(
          child: ExpansionPanelList.radio(
            children: [
              ExpansionPanelRadio(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                value: 1,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          flag,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          url,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  );
                },
                body: InstanceInfoDataTable(
                  location: location,
                  type: type,
                  health: health,
                  signUp: signUp,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Radio(
            value: instances[index],
            //Retrieve the currently saved value.
            groupValue: radioButtonCubit.invCubit.prefs.getString('currentInstance'),
            onChanged: (value) {
              //A function that emits the new state of a radio button.
              radioButtonCubit.selectOption(instances[index]);

              //Save the selected 
              radioButtonCubit.invCubit.currentInstance(value.toString());
            },
          ),
        ),
      ],
    );
  }
}
