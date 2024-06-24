class VideoId {
  
  //Regex patterns to extract the video ID from different types of YouTube URLs.
  static final normalVideo = RegExp(r'youtube\..+?/watch.*?v=(.*?)(?:&|/|$)');
  static final shortVideo = RegExp(r'youtu\.be/(.*?)(?:\?|&|/|$)');
  static final embedVideo = RegExp(r'youtube\..+?/embed/(.*?)(?:\?|&|/|$)');
  static final shortsVideo = RegExp(r'youtube\..+/shorts/(.*?)(?:\?|&|/|$)');

  static List<RegExp> patterns = [
    normalVideo,
    shortVideo,
    shortsVideo,
    embedVideo
  ];

  static String? getVideoId(String url) {
    
    for (RegExp pattern in patterns) {
      if (pattern.hasMatch(url)) {
        return pattern.firstMatch(url)!.group(1);
      }
    }
    return null;
  }
}
