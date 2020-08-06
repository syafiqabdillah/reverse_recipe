import 'package:flutter/material.dart';
import 'package:rere/pages/home.dart';
import 'package:rere/pages/loading.dart';
import 'package:rere/pages/add_bahan.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/loading': (context) => Loading(),
      '/add_bahan': (context) => AddBahan(),
    },
  ));
}


