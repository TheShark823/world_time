import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location; //location name for the UI
  String time = ''; //time for the location chosen
  String flag; //flag of the location
  String url; //url for the location

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      final response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      print('$offset');

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

//set time property
      time = now.toString();
    } catch (e) {
      print("caught error $e");
      time = ("error while loading");
    }
  }
}
