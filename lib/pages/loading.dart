import 'package:flutter/material.dart';
import 'package:worldclockapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _State();
}

class _State extends State<Loading> {
  String time = 'loading';

  void setupworldtime() async {
    world_time setinstance =
    world_time(location: 'kolkata', flag: 'india.jpg', url: 'Asia/kolkata');
    await setinstance
        .setTime(); // this will call the get time funct in the world time file////
    setState(() {
      time = setinstance.time; // these are not necessary steps
    });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': setinstance.location,
      'flag': setinstance.flag,
      'time': setinstance.time,
      'isdaytime':setinstance.isdaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupworldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child:
            SpinKitCubeGrid(
            color: Colors.white,
            size: 50.0,
          ))
      ),
    );
  }
}
