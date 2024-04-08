class PlaylistId {
  
  //Regex patterns to extract the playlist ID from different types of YouTube URLs.
  static final normalPlaylist = RegExp(r'youtube\..+?/playlist.*?list=(.*?)(?:&|/|$)');
  static final singleVidPlaylist = RegExp(r'youtube\..+?/watch.*?list=(.*?)(?:&|/|$)');
  static final shortPlaylist = RegExp(r'youtu\.be/.*?/.*?list=(.*?)(?:&|/|$)');
  static final embedPlaylist = RegExp(r'youtube\..+?/embed/.*?/.*?list=(.*?)(?:&|/|$)');
  
  static String? getPlaylistId(String url) {

    final List<RegExp> playlistPatterns = [
      normalPlaylist,
      singleVidPlaylist,
      shortPlaylist,
      embedPlaylist
    ];

    for (RegExp pattern in playlistPatterns) {
      if (pattern.hasMatch(url)) {
        return pattern.firstMatch(url)!.group(1);
      }
    }

    return null;
  }
}
