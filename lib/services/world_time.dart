import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location name for UI
  String time = ''; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for API endpoint
  bool isDaytime = true;


  WorldTime({ required this.location, required this.flag, required this.url });
  Future<void> getTime() async {

    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      //Get properties from data
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // print(datetime);
      // print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 5 && now.hour < 14 ? true : false;
      //set time property
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught Error: $e');
      time = 'Could not get time data';
    }

  }


}

WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
