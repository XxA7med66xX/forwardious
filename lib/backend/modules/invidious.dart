class Invidiuos {
  ///The url of the instance.
  final String url;

  ///The location of the instance.
  final String location;

  ///The type of the instance, for example: HTTP/HTTPS.
  final String type;

  ///The ability to sign up on this instance, for example: true.
  final String signupSupport;

  ///Health refers to the uptime/downtime of this instance, for example: 99%.
  final String health;
  
  ///The flag that indicates the country of this instance, for example: 🇾🇪.
  final String flag;

  Invidiuos({
    required this.url,
    required this.location,
    required this.type,
    required this.signupSupport,
    required this.health,
    required this.flag,
  });
}
