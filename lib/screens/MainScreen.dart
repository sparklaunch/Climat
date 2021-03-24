import "package:flutter/material.dart";

import "package:climat/services/WeatherHelper.dart";

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    final dynamic receivedData = ModalRoute.of(context).settings.arguments;
    final int weatherCode = receivedData["weather"][0]["id"];
    final WeatherHelper weatherHelper = WeatherHelper(
      weatherCode: weatherCode,
    );
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("Climat"),
      ),
      body: Container(
        child: null,
      ),
    );
  }
}
