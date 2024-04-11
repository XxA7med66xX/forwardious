import 'package:chrome_extension/cookies.dart';

///This class is responsable for all the
///processes of chrome cookies.
class ChromeCookies {
  ///As its name suggests, it overrides the existing
  ///Chrome cookies with new values.
  static override(String name, String url, String value) {
    chrome.cookies.set(SetDetails(url: url, name: name, value: value));
  }
}
