import "package:flutter/material.dart";

import "package:climat/services/WeatherHelper.dart";

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final dynamic receivedData = ModalRoute.of(context).settings.arguments;
    final int weatherCode = receivedData["weather"][0]["id"];
    final WeatherHelper weatherHelper = WeatherHelper(
      weatherCode: weatherCode,
    );
    return Scaffold(
      backgroundColor: weatherHelper.getBackgroundColor(),
      appBar: AppBar(
        title: Text("Climat"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                receivedData["name"],
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "./assets/images/${weatherHelper.getWeatherImage()}",
                    scale: 4.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    "${receivedData["main"]["temp"].toInt().toString()}°C",
                    style: TextStyle(
                      fontSize: 96.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                weatherHelper.getWeatherStatus().toUpperCase(),
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "MIN / MAX : ${receivedData["main"]["temp_min"].toInt().toString()} / ${receivedData["main"]["temp_max"].toInt().toString()}",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "HUMIDITY : ${receivedData["main"]["humidity"]}%",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                ),
                child: Text(
                  "Search by city name",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
