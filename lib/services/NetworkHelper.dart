import "package:flutter/material.dart";
import "dart:core";
import "dart:convert";
import "package:http/http.dart" as http;

class NetworkHelper {
  Uri _uri;
  Future<dynamic> getData() async {
    try {
      final http.Response response = await http.get(this._uri);
      return jsonDecode(response.body);
    } catch (exception) {
      print("Error: $exception, failed to receive data");
    }
  }

  NetworkHelper({@required String uri}) {
    this._uri = Uri.parse(uri);
  }
}
