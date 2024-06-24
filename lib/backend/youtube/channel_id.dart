class ChannelId {

  //Regex patterns to extract the channel ID from different types of YouTube URLs.
  static final pattern1 = RegExp(r'youtube\..+?/channel/(.*?)(?:\?|&|/|$)');
  static final pattern2 = RegExp(r'youtube\..+?/c/(.*?)(?:\?|&|/|$)');
  
  static List<RegExp> patterns = [pattern1, pattern2];

  static String? getChannelId(String url) {

    for (RegExp pattern in patterns) {
      if (pattern.hasMatch(url)) {
        return pattern.firstMatch(url)!.group(1);
      }
    }

    return '';
  }
}