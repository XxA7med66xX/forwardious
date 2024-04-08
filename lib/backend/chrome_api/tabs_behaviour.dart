import 'package:chrome_extension/tabs.dart';
import 'package:forwardious/backend/youtube/url_processing.dart';
import 'package:chrome_extension/storage.dart';
main() {}

class TabsBehaviour {
  final String tabUrl;
  final int tabId;
  String? currentInstance;
  bool? deleteTab;

  TabsBehaviour.behaviour(this.tabUrl, this.tabId) {
    behaviour();
  }

  late final yt = UrlProcessing(tabUrl);
  
  Future<void> initStorage() async {
    currentInstance = await chrome.storage.local
        .get('currentInstance')
        .then((value) => value['currentInstance']);
    deleteTab = await chrome.storage.local
        .get('tabMode')
        .then((value) => value['tabMode']);
  }

  Future<void> behaviour() async {

    await initStorage();

    if (deleteTab!) {
      chrome.tabs.remove(tabId);
      chrome.tabs.create(
        CreateProperties(
          url: '$currentInstance/${yt.type}${yt.id}',
        ),
      );
    } else {
      chrome.tabs.update(
        tabId,
        UpdateProperties(url: '$currentInstance/${yt.type}${yt.id}'),
      );
    }
  }
  
}
