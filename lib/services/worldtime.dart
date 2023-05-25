import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location = ""; //location name for the UI
  String time = ""; //time in the location for the UI
  String flag = ""; //url for asset for a flag icon
  String url_location = ""; //location url for api endpoint
  bool isDay = true;

  WorldTime(
      {required this.location, required this.flag, required this.url_location});

// this Future<void> thing basically tells dart because we need to return something to let dart know that our operation is done(because we are using await therefore dart needs to know how long it should wait), but this something is actually void, this Future handles the nothing is being returned and instead return like a placeholder that tells dart that our operation is done
  Future<void> getTime() async {
    try {
      Uri url = Uri.parse("http://worldtimeapi.org/api/timezone/$url_location");
      Response response = await get(url);
      Map kl = jsonDecode(response.body);
      String offset = kl["utc_offset"].substring(1, 3);
      DateTime datetime = DateTime.parse(kl["datetime"]);
      datetime = datetime.add(Duration(hours: int.parse(offset)));
      isDay = datetime.hour > 6 && datetime.hour < 19 ? true : false;
      time = DateFormat.jm().format(
          datetime); //DateFormat is from the intl package to format our time
    } catch (e) {
      print("error: $e");
      time = "time not found";
    }
  }
}
