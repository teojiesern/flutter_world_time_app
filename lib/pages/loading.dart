import 'package:flutter/material.dart';
import 'package:time/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime kl = WorldTime(
        location: "Kuala Lumpur",
        flag: "kl.png",
        url_location: "Asia/Kuala_Lumpur");
    await kl.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": kl.location,
      "time": kl.time,
      "isDay": kl.isDay
    });
    // the pushReplacementNamed is to push the home page and replace out the loading page instead of keeping the loading screen beneath
    // the arguments is to pass to whichever page this is routing to a set of datas which is in the form of a map
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
