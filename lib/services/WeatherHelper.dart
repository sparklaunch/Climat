import "package:flutter/material.dart";

class WeatherHelper {
  String _status = "sunny";
  Color _backgroundColor = Colors.lightBlue;
  String _image = "sunny.png";
  WeatherHelper({@required int weatherCode = 800}) {
    if (weatherCode > 800) {
      this._status = "cloudy";
      this._backgroundColor = Colors.blueGrey;
      this._image = "cloudy.png";
    } else if (weatherCode == 800) {
      this._status = "sunny";
      this._backgroundColor = Colors.lightBlue;
      this._image = "sunny.png";
    } else if (weatherCode >= 700) {
      this._status = "atmosphere";
      this._backgroundColor = Colors.brown;
      this._image = "overcast.png";
    } else if (weatherCode >= 600) {
      this._status = "snow";
      this._backgroundColor = Colors.white54;
      this._image = "snow.png";
    } else if (weatherCode >= 500) {
      this._status = "rain";
      this._backgroundColor = Colors.indigo;
      this._image = "rainy.png";
    } else if (weatherCode >= 300) {
      this._status = "drizzle";
      this._backgroundColor = Colors.grey;
      this._image = "rainy.png";
    } else if (weatherCode >= 200) {
      this._status = "thunderstorm";
      this._backgroundColor = Colors.black45;
      this._image = "lightning.png";
    } else {
      this._status = "N/A";
      this._backgroundColor = Colors.lightBlue;
      this._image = "sunny.png";
    }
  }
  String getWeatherStatus() {
    return this._status;
  }

  Color getBackgroundColor() {
    return this._backgroundColor;
  }

  String getWeatherImage() {
    return this._image;
  }
}
