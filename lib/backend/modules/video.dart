abstract class Video {
  ///Youtube video url
  final String url;
  ///The id of the video or playlist
  late final String? id;
  ///Type of the link for example https://www.youtube.com/watch?v=videoid
  ///if the type is [watch] this means it's url for a video
  ///(playlist = list of videos, channel = youtube channel)
  late final String? type;

  Video({required this.url,required this.id,this.type});
}