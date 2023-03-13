import 'package:flutter/material.dart';
import 'package:flutter_tutorial3/pages/choose_location.dart';
import 'package:flutter_tutorial3/pages/home.dart';
import 'package:flutter_tutorial3/pages/choose_location.dart';
import 'package:flutter_tutorial3/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    // initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
