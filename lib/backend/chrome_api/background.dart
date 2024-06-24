import 'package:chrome_extension/action.dart';
import 'package:chrome_extension/runtime.dart';
import 'package:chrome_extension/tabs.dart';
import 'package:forwardious/backend/chrome_api/tabs_behaviour.dart';
import 'package:forwardious/backend/youtube/url_processing.dart';

main() async {
  //Open popup of the extention once you
  //install it to load the api of invidious
  //and set first instance of invidious as
  //default instance.
  chrome.runtime.onInstalled.listen((event) {
    chrome.action.openPopup(OpenPopupOptions());
  });

  chrome.tabs.onUpdated
      .where((tab) => tab.changeInfo.url?.contains('youtube') ?? false)
      .listen(
    (tab) {
      if (UrlProcessing.hasMatch(tab.changeInfo.url!)) {
        TabsBehaviour.behaviour(tab.changeInfo.url!, tab.tabId);
      }
    },
  );

  chrome.tabs.onCreated
      .where((tab) => tab.url?.contains('youtube') ?? false)
      .listen(
    (tab) {
      if (UrlProcessing.hasMatch(tab.url!)) {
        TabsBehaviour.behaviour(tab.url!, tab.id!);
      }
    },
  );
}