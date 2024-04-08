import 'package:forwardious/backend/youtube/channel_id.dart';
import 'package:forwardious/backend/youtube/playlist_id.dart';
import 'package:forwardious/backend/youtube/video_id.dart';

class UrlId {

  static String? getId(String url) {
    String? id = '';
    id = VideoId.getVideoId(url);
    id ??= PlaylistId.getPlaylistId(url);
    id ??= ChannelId.getChannelId(url);
    return id;
  }
  
}