import 'package:flutter/material.dart';
import 'package:worldclockapp/services/world_time.dart';

class Locationupdate extends StatefulWidget {
  const Locationupdate({super.key});

  @override
  State<Locationupdate> createState() => _LocationupdateState();
}

class _LocationupdateState extends State<Locationupdate> {
  List<world_time> locations = [
    world_time(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    world_time(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    world_time(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    world_time(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    world_time(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    world_time(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    world_time(url: 'Asia/kolkata', location: 'kolkata', flag: 'india.png'),
    world_time(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    world_time(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png')
  ];

  void updatetime(index) async
  {
    world_time instance = locations[index];
    await instance.setTime();

    // navigate back to the home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isdaytime': instance.isdaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Location update'),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updatetime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(backgroundImage: AssetImage(
                      'images/${locations[index].flag}')),
                ),
              ),
            );
          },
          itemCount: locations.length,
        ));
  }
}
