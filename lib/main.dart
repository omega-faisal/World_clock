import 'package:flutter/material.dart';
import 'package:worldclockapp/pages/LocationUpdate.dart';
import 'package:worldclockapp/pages/home.dart';
import 'package:worldclockapp/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/loading',
    home: Home(),
    routes: {
      '/loading': (Context) => Loading(),
      '/home': (Context) => Home(),
      '/location': (Context) => Locationupdate()
    },
  ));
}

