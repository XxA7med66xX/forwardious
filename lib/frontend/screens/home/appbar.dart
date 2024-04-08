import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious_instance_cubit.dart';
import 'package:forwardious/frontend/modules/custom_flat_button.dart';
import 'package:forwardious/i18n/strings.g.dart';

class CustomAppBar extends StatelessWidget {
  ///A simple appbar for settings screen. 
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        CustomFlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed('settings');
          },
          icon: const Icon(Icons.settings),
          tooltip: context.t.home.settings,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            context.read<InvidiousInstanceCubit>().reloadInvidiousInstances();
          },
          style: const ButtonStyle(
            splashFactory: NoSplash.splashFactory
          ),
          child: Text(
            'Forwardious',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
