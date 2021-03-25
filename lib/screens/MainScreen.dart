import "package:flutter/material.dart";

import "package:climat/services/WeatherHelper.dart";

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color backgroundColor;
  String cityName;
  int temperature;
  String status;
  String image;
  int minTemperature;
  int maxTemperature;
  int humidity;

  void updateUI() {
    final dynamic weatherData = ModalRoute.of(context).settings.arguments;
    final int weatherCode = weatherData["weather"][0]["id"];
    final WeatherHelper weatherHelper = WeatherHelper(
      weatherCode: weatherCode,
    );
    setState(() {
      this.backgroundColor = weatherHelper.getBackgroundColor();
      this.cityName = weatherData["name"];
      this.temperature = weatherData["main"]["temp"].toInt();
      this.status = weatherHelper.getWeatherStatus();
      this.minTemperature = weatherData["main"]["temp_min"].toInt();
      this.maxTemperature = weatherData["main"]["temp_max"].toInt();
      this.humidity = weatherData["main"]["humidity"];
      this.image = weatherHelper.getWeatherImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    this.updateUI();
    return Scaffold(
      backgroundColor: this.backgroundColor,
      appBar: AppBar(
        title: Text("Climat"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                this.cityName,
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
                    "./assets/images/${this.image}",
                    scale: 4.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    "${this.temperature}°C",
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
                this.status.toUpperCase(),
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "MIN / MAX : ${this.minTemperature.toString()} / ${this.maxTemperature.toString()}",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "HUMIDITY : ${this.humidity}%",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/search");
                },
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
