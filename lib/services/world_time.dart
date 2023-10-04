import 'dart:core';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';
class world_time {
  late String location;// location name for the ui
  late String time; // time which has to be shown in the ui
  late String flag; // a title path for the flag of country to use as image asset
  late String url; // url of actual place
  bool isdaytime=false;

  world_time({required this.location,required this.flag,required this.url});
  // a constructor..

   Future<void> setTime() async
  {
    try{
      // this is a asynchronous code...
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String DatenTime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3); // for adding hour part of offset
      String offset_min=data['utc_offset'].substring(4,6); // for adding minute part of offset

      print(data);
      print(offset_min);
      print(offset);
      // creating a new datetime object
      DateTime datetime = DateTime.parse(DatenTime);// this is actual date and time object which have date and time
      // merged in a single string...

      // adding the extra offset to get the correct time
      datetime = datetime.add(Duration(hours: int.parse(offset)));
      datetime = datetime.add(Duration(minutes: int.parse(offset_min))); // this is to add the extra minutes

      // we will decide if the current time is day or night using a ternary operator

      isdaytime= datetime.hour>6 && datetime.hour<20 ? true : false;
      time = DateFormat.jm().format(datetime);
    }
    catch(e){
      print('the error is : $e');
      // now in the state of error we wish that our ui gives some message like data couldn't be loaded or so...
      time="Data couldn't be loaded";
    }
  }
}
