import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/storage/chrome_storage.dart';
import 'package:forwardious/backend/invidious/instance_info.dart';
import 'package:forwardious/backend/modules/invidious.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'invidious_instance_state.dart';

class InvidiousInstanceCubit extends Cubit<InvidiousInstanceState> {

  final SharedPreferences prefs;
  
  InvidiousInstanceCubit(this.prefs) : super(InvidiousInstanceInitial()) {
    loadInvidiousInstances();
  }
  
  ///The [loadInvidiousInstances] function runs once you
  ///open the extension and load the API and then emits the
  ///new state.
  ///The variable [firstRun] check if your'e running the
  ///app for first time, if [true] will save the first 
  ///instance of invidious as defalut instance, if [false]
  ///will just ignore it and use the selected instance by user.
  
  Future<void> loadInvidiousInstances() async {

    bool firstRun = prefs.getBool('firstRun') ?? true;

    final invidiousInstances = await InvidiousInstanceInfo.getData();

    firstRun? currentInstance(invidiousInstances?.first.url??'') : null;

    emit(
      invidiousInstances != null
          ? LoadInvidiousInstances(
              url: invidiousInstances,
              location: invidiousInstances,
              flag: invidiousInstances,
              type: invidiousInstances,
              signupSupport: invidiousInstances,
              health: invidiousInstances,
            )
          : InvidiousInstancesNull(errorMessage: 'value is null'),
    );
    
    prefs.setBool('firstRun', false);
  }

  ///Saves the current invidious instance in both [SharedPreferences]
  ///and [Chrome Storage Api].

  void currentInstance(String currentInstance) {
    prefs.setString('currentInstance', currentInstance);
    ChromeStorage.save({"currentInstance":currentInstance});
    emit(CurrentInstances(currentInstance: prefs.getString('currentInstance')!));
  }

  ///Emit the initial state to show [CircularProgressIndicator]
  ///then load the new state which retrieves the data from
  ///the API to emit a new state.

  void reloadInvidiousInstances() {
    emit(InvidiousInstanceInitial());
    loadInvidiousInstances();
  }
}
