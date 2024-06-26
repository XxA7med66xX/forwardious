import 'package:forwardious/backend/modules/invidious.dart';
import 'api.dart';

class InvidiousInstanceInfo {

  static Future<List<Invidiuos>?> getData() async {

    final json = await InvidiousApi().get();

    List<Invidiuos> instances = [];

    if (json != null) {
      for (var entry in json) {
        // Create a new instance of Invidiuos class and add it to the instances list.
        instances.add(
          Invidiuos(
            url: entry[1]?['uri'] ?? '',
            location: entry[1]?['region'] ?? '',
            flag: entry[1]?['flag'] ?? '',
            type: entry[1]?['type'] ?? '',
            signupSupport: entry[1]?['stats']?['openRegistrations']?.toString() ?? '-',
            health: entry[1]['monitor']?['uptime'].toString() ?? '',
          ),
        );
      }
      return instances;
    } else {
      return null;
    }
  }
}