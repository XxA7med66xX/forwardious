class UrlType {

  static final regexPattern = RegExp(r'youtube\..+?/(.*?)(?:\?|&|/|$)');

  static String? getType(String url) {
    String? urlType;
    if (regexPattern.hasMatch(url)) {
      urlType = regexPattern.firstMatch(url)!.group(1);
      switch (urlType) {
        case 'watch':
          urlType = 'watch?v=';
        case 'playlist':
          urlType = 'playlist?list=';
        case 'shorts':
          urlType = 'watch?v=';
        case 'embed':
          urlType = 'watch?v=';
        case 'channel':
          urlType = 'channel/';
        case 'c':
          urlType = '@';
          break;
        default:
      }
    } else {
      urlType = '';
    }
    return urlType;
  }
}