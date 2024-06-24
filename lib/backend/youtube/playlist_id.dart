class PlaylistId {
  
  //Regex patterns to extract the playlist ID from different types of YouTube URLs.
  static final normalPlaylist = RegExp(r'youtube\..+?/playlist.*?list=(.*?)(?:&|/|$)');
  static final singleVidPlaylist = RegExp(r'youtube\..+?/watch.*?list=(.*?)(?:&|/|$)');
  static final shortPlaylist = RegExp(r'youtu\.be/.*?/.*?list=(.*?)(?:&|/|$)');
  static final embedPlaylist = RegExp(r'youtube\..+?/embed/.*?/.*?list=(.*?)(?:&|/|$)');

  static List<RegExp> patterns = [
    normalPlaylist,
    singleVidPlaylist,
    shortPlaylist,
    embedPlaylist
  ];

  static String? getPlaylistId(String url) {

    for (RegExp pattern in patterns) {
      if (pattern.hasMatch(url)) {
        return pattern.firstMatch(url)!.group(1);
      }
    }

    return null;
  }
}
