import "package:flutter/material.dart";

import "package:climat/services/WeatherHelper.dart";
import "package:climat/services/NetworkHelper.dart";

import "package:climat/utilities/constants.dart";

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  dynamic weatherData;
  Color backgroundColor;
  String cityName;
  int temperature;
  String status;
  String image;
  int minTemperature;
  int maxTemperature;
  int humidity;

  void receiveData() {
    setState(() {
      this.weatherData = ModalRoute.of(context).settings.arguments;
    });
  }

  void updateUI() {
    final int weatherCode = this.weatherData["weather"][0]["id"];
    final WeatherHelper weatherHelper = WeatherHelper(
      weatherCode: weatherCode,
    );
    setState(() {
      this.backgroundColor = weatherHelper.getBackgroundColor();
      this.cityName = this.weatherData["name"];
      this.temperature = this.weatherData["main"]["temp"].toInt();
      this.status = weatherHelper.getWeatherStatus();
      this.minTemperature = this.weatherData["main"]["temp_min"].toInt();
      this.maxTemperature = this.weatherData["main"]["temp_max"].toInt();
      this.humidity = this.weatherData["main"]["humidity"];
      this.image = weatherHelper.getWeatherImage();
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.receiveData();
      this.updateUI();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                this.cityName ?? "No City Name",
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
                    "./assets/images/${this.image ?? "sunny.png"}",
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
                this.status == null ? "No Status" : this.status.toUpperCase(),
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
                onPressed: () async {
                  dynamic userInput =
                      await Navigator.pushNamed(context, "/search");
                  if (userInput != null) {
                    final NetworkHelper networkHelper =
                        NetworkHelper(uri: "$endPoint&q=$userInput");
                    dynamic data = await networkHelper.getData();
                    setState(() {
                      this.weatherData = data;
                    });
                    this.updateUI();
                  }
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
