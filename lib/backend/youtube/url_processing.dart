import 'package:forwardious/backend/youtube/id.dart';
import 'package:forwardious/backend/youtube/url_type.dart';
import 'package:forwardious/backend/modules/video.dart';

class UrlProcessing extends Video {
  ///A class that processes the YouTube URL
  ///and extracts its ID and type (such as /channel, /playlist, ...etc).
  UrlProcessing(String url) : super(url: url,id: UrlId.getId(url),type: UrlType.getType(url));
}