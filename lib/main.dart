import 'package:flutter/material.dart';

import "package:climat/screens/LoadingScreen.dart";
import "package:climat/screens/MainScreen.dart";
import "package:climat/screens/SearchScreen.dart";

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "Open Sans",
      ),
      title: "Climat",
      initialRoute: "/",
      routes: {
        "/": (context) => LoadingScreen(),
        "/index": (context) => MainScreen(),
        "/search": (context) => SearchScreen(),
      },
    ),
  );
}
