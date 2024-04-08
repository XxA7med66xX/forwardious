import 'package:chrome_extension/storage.dart';

/// This class will be used for all save processes to Chrome storage.
/// 
/// Chrome storage keys:
/// "currentInstance" | [String] , saves the current instance of Invidious.
/// "tabMode" | [bool] , true = remove tab, false = update tab.
 
class ChromeStorage {
  static save(Map items) {
    chrome.storage.local.set(items);
  }
}
