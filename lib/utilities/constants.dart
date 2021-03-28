import "package:flutter/material.dart";

const String APIKey = "44cb96a7a3051603c69daacf97dd1440";
const String endPoint =
    "https://api.openweathermap.org/data/2.5/weather?units=metric&lang=kr&appid=$APIKey";

const double kTextFieldWidth = 200.0;

const TextStyle kCityNameTextStyle = TextStyle(
  fontSize: 24.0,
  color: Colors.white,
);
const TextStyle kTemperatureTextStyle = TextStyle(
  fontSize: 96.0,
  color: Colors.white,
);
const TextStyle kStatusTextStyle = TextStyle(
  fontSize: 24.0,
  color: Colors.white,
);
const TextStyle kMinMaxTemperatureTextStyle = TextStyle(
  fontSize: 24.0,
  color: Colors.white,
);
const TextStyle kHumidityTextStyle = TextStyle(
  fontSize: 24.0,
  color: Colors.white,
);
const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 20.0,
);
const TextStyle kCityTextFieldLabelTextStyle = TextStyle(
  fontSize: 32.0,
  color: Colors.white,
);
const TextStyle kSearchButtonTextStyle = TextStyle(
  fontSize: 24.0,
  color: Colors.white,
);
const TextStyle kSubmitButtonTextStyle = TextStyle(
  fontSize: 24.0,
);

const SizedBox kGapBetweenCityNameAndTemperature = SizedBox(
  height: 30.0,
);
const SizedBox kGapBetweenWeatherIconAndTemperature = SizedBox(
  width: 30.0,
);
const SizedBox kGapBetweenTemperatureAndStatus = SizedBox(
  height: 30.0,
);
const SizedBox kGapBetweenStatusAndMinMaxTemperature = SizedBox(
  height: 10.0,
);
const SizedBox kGapBetweenMinMaxTemperatureAndHumidity = SizedBox(
  height: 10.0,
);
const SizedBox kGapBetweenHumidityAndButton = SizedBox(
  height: 30.0,
);
const SizedBox kGapBetweenLabelAndTextField = SizedBox(
  height: 30.0,
);
const SizedBox kGapBetweenTextFieldAndButton = SizedBox(
  height: 30.0,
);

final ButtonStyle kBottomButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 16.0,
  ),
);
final ButtonStyle kSubmitButtonButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.lightBlue,
  padding: EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 8.0,
  ),
);

const InputDecoration kSearchButtonInputDecoration = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black38,
    ),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
    ),
  ),
  hintText: "Enter here",
  hintStyle: TextStyle(
    color: Colors.blueGrey,
  ),
  isDense: true,
  contentPadding: EdgeInsets.only(
    bottom: 5.0,
  ),
);
