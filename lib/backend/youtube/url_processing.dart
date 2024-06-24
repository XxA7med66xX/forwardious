import 'package:forwardious/backend/youtube/channel_id.dart';
import 'package:forwardious/backend/youtube/id.dart';
import 'package:forwardious/backend/youtube/playlist_id.dart';
import 'package:forwardious/backend/youtube/url_type.dart';
import 'package:forwardious/backend/modules/video.dart';
import 'package:forwardious/backend/youtube/video_id.dart';

class UrlProcessing extends Video {
  ///A class that processes the YouTube URL
  ///and extracts its ID and type (such as /channel, /playlist, ...etc).
  UrlProcessing(String url) : super(url: url,id: UrlId.getId(url),type: UrlType.getType(url));

  static bool hasMatch(String url) {
    final List<RegExp> patterns = [
    ...VideoId.patterns,
    ...PlaylistId.patterns,
    ...ChannelId.patterns,
  ];

    for (var pattern in patterns) {
      if (pattern.hasMatch(url)) {
        return true;
      }
    }

    return false;
  }
}