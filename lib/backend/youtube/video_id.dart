class VideoId {
  
  //Regex patterns to extract the video ID from different types of YouTube URLs.
  static final normalVideo = RegExp(r'youtube\..+?/watch.*?v=(.*?)(?:&|/|$)');
  static final shortVideo = RegExp(r'youtu\.be/(.*?)(?:\?|&|/|$)');
  static final embedVideo = RegExp(r'youtube\..+?/embed/(.*?)(?:\?|&|/|$)');
  static final shortsVideo = RegExp(r'youtube\..+/shorts/(.*?)(?:\?|&|/|$)');

  static String? getVideoId(String url) {
    
    final List<RegExp> videoPatterns = [
      normalVideo,
      shortVideo,
      shortsVideo,
      embedVideo
    ];

    for (RegExp pattern in videoPatterns) {
      if (pattern.hasMatch(url)) {
        return pattern.firstMatch(url)!.group(1);
      }
    }
    return null;
  }
}
