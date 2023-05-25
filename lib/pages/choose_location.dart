import 'package:flutter/material.dart';
import 'package:time/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url_location: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(
        url_location: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(
        url_location: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        url_location: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(
        url_location: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        url_location: 'America/New_York',
        location: 'New York',
        flag: 'usa.png'),
    WorldTime(
        url_location: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        url_location: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png'),
    WorldTime(
        url_location: 'Asia/Kuala_Lumpur',
        location: 'Kuala Lumpur',
        flag: 'malaysia.png'),
  ];

  void updateTime(index) async {
    await locations[index].getTime();
    Navigator.pop(context, { // this pop will return this map to the code that pushes this page to the screen which is the textbutton in home.dart
      "location": locations[index].location,
      "time": locations[index].time,
      "isDay": locations[index].isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose your location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
