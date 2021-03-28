import 'package:climat/utilities/constants.dart';
import "package:flutter/material.dart";

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String userInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Climat"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter a city name",
                style: kCityTextFieldLabelTextStyle,
              ),
              kGapBetweenLabelAndTextField,
              Container(
                width: kTextFieldWidth,
                child: TextField(
                  decoration: kSearchButtonInputDecoration,
                  style: kSearchButtonTextStyle,
                  onChanged: (event) {
                    setState(() {
                      this.userInput = event;
                    });
                  },
                ),
              ),
              kGapBetweenTextFieldAndButton,
              ElevatedButton(
                style: kSubmitButtonButtonStyle,
                onPressed: () {
                  Navigator.pop(context, this.userInput);
                },
                child: Text(
                  "Submit",
                  style: kSubmitButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
