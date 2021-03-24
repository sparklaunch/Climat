import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

import "package:climat/services/GeolocatorHelper.dart";
import "package:climat/services/NetworkHelper.dart";

import "package:climat/utilities/constants.dart";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getWeatherData() async {
    Map<String, double> coordinates = await GeolocatorHelper().getGeoData();
    final NetworkHelper networkHelper = NetworkHelper(
        uri:
            "$endPoint&lat=${coordinates["latitude"]}&lon=${coordinates["longitude"]}");
    final dynamic data = await networkHelper.getData();
    Navigator.pushNamed(context, "/index", arguments: data);
  }

  @override
  void initState() {
    this.getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Climat"),
      ),
      body: SafeArea(
        child: Center(
          child: SpinKitRing(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
