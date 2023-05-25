import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    // this is to get the data from whichever page that is pushing this page and passing in some arguments.
    // the '!' is a null check, that means check if its null, if not sthen progress.
    // the '!' can be replaced with a '?' which means the object can be nullable
    // only when data is empty, we put in the kuala lumpur thing else we put in the data itself which in this case is the data which is returned from the individual choose location cards which triggered this rebuild using set state
    String bgImg = data["isDay"] ? "day.png" : "night.png";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/$bgImg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(children: [
            TextButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(
                    context,
                    "/location",
                  );
                  setState(() {
                    data = {
                      "time": result["time"],
                      "location": result["location"],
                      "isDay": result["isDay"]
                    };
                  });
                },
                style: TextButton.styleFrom(primary: Colors.white),
                icon: Icon(Icons.edit_location),
                label: Text("edit location")),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data["location"],
                  style: TextStyle(
                      fontSize: 28, letterSpacing: 2, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              data["time"],
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}
