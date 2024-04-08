import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabRefreshCubit extends Cubit<String> {
  TabRefreshCubit(this.prefs) : super('');

  final SharedPreferences prefs;
  //Retrieve the saved value from storage, with a default value
  //of 'Update' that comes from the generated locale code
  //by the slang library [t.settingsScreen.updateTab].
  late String? selected = prefs.getString('tabMode') ?? t.settingsScreen.updateTab;

  updateTab() {
    ///Save the selected value in storage using [SharedPreferences]
    prefs.setString('tabMode', t.settingsScreen.updateTab);
    selected = prefs.getString('tabMode');
    emit('RemoveTab');
  }

  removeTab() {
    prefs.setString('tabMode', t.settingsScreen.removeTab);
    selected = prefs.getString('tabMode');
    emit('UpdateTab');
  }
}
