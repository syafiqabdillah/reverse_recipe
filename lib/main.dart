import 'package:flutter/material.dart';
import 'package:rere/pages/home.dart';
import 'package:rere/pages/loading.dart';
import 'package:rere/pages/add_bahan.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    theme: ThemeData(
        textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      fontFamily: 'IndieFlower',
      displayColor: Colors.grey[700],
      bodyColor: Colors.grey[700],
    )),
    routes: {
      '/': (context) => Home(),
      '/loading': (context) => Loading(),
      '/add_bahan': (context) => AddBahan(),
    },
  ));
}
