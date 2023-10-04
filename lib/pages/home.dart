import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {}; // an empty map
  @override
  Widget build(BuildContext context) {
    try {
      data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;
      // here we are saying first check if the data map is empty and if it is so then assign it as Modal route..
      // and if its not empty and has been set in the set state method then assign it equal to the old value
      // which we have set in the set state function..
    } catch (e) {
      data = data;
    }
    String bgimage = data['isdaytime'] ? 'daywall.jpg' : 'nightwall.jpg';
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/$bgimage'), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 150, 20, 0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                  onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     // when we get the time and all the data back from the location update screen as
                     // a pop result then we will set our data map equal to the data we get from the location update screen.
                     data= {
                       'location': result['location'],
                       'flag':  result['flag'],
                       'time':  result['time'],
                       'isdaytime':  result['isdaytime']
                     };
                   });
                  },
                  child: const Icon(
                    Icons.edit_location,
                    size: 50,
                  )),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                        style: TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(data['time'],
                      style: const TextStyle(
                          fontSize: 46, letterSpacing: 2, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
