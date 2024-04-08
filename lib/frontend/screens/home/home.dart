import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious_instance_cubit.dart';
import 'package:forwardious/frontend/modules/expanstion_panel_list.dart';
import 'package:forwardious/frontend/screens/home/appbar.dart';
import 'package:forwardious/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          
          const CustomAppBar(),

          Expanded(
            child: BlocConsumer<InvidiousInstanceCubit, InvidiousInstanceState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadInvidiousInstances) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.url.length,
                          itemBuilder: (context, index) {
                            return ExpanstionList(
                              flag: state.flag[index].flag,
                              url: state.url[index].url,
                              location: state.location[index].location,
                              type: state.type[index].type,
                              health: state.health[index].health,
                              signUp: state.signupSupport[index].signupSupport,
                              instances: state.url.map((urls) => urls.url).toList(),
                              index: index,
                              locale: context.t,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is InvidiousInstancesNull) {
                  return Center(
                    child: Text(context.t.errors.networkConnectionError),
                  );
                } else {
                  //If none of these states are emitted, then a [CircularProgressIndicator] appears.
                  return Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).progressIndicatorTheme.color),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
