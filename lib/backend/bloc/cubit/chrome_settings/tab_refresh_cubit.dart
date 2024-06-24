import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/chrome_api/storage/chrome_storage.dart';
import 'package:forwardious/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabRefreshCubit extends Cubit<String> {
  TabRefreshCubit(this.prefs) : super('');

  final SharedPreferences prefs;
  
  late String? selectedItem = prefs.getString('tabMode') ?? 'updateTab';

  late Map<String, String> wordMap;

  //When the value is ['removeTab'], it means that Chrome
  //will remove the tab once you open a YouTube URL
  //and create another tab with the Invidious instance.
  //If the value is ['updateTab'],it will just update the current tab.

  //Then I set the values in the Chrome storage using
  //the Chrome API so that I can use these values in the
  //background.dart.js file.
  void selected(String item) {
    switch (item) {
      case 'updateTab':
        selectedItem = item;
        prefs.setString('tabMode', item);
        ChromeStorage.save({'deleteTab': false}); //Chrome Api
        emit(item);
      
      case 'removeTab':
        selectedItem = item;
        prefs.setString('tabMode', item);
        ChromeStorage.save({'deleteTab': true}); //Chrome Api
        emit(item);
        break;
      default:
    }
  }

  void buildWordMap(BuildContext context) {
    wordMap = {
      'updateTab': context.t.settingsScreen.updateTab,
      'removeTab': context.t.settingsScreen.removeTab,
    };
    emit(selectedItem ?? context.t.settingsScreen.updateTab);
  }

  String getSelectedValue(BuildContext context) {
    return wordMap[selectedItem] ?? context.t.settingsScreen.updateTab;
  }
}
