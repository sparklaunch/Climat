import "package:flutter/material.dart";

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final dynamic receivedData = ModalRoute.of(context).settings.arguments;
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
