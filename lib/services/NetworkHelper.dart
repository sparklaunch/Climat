import "package:flutter/material.dart";
import "dart:core";
import "dart:convert";
import "package:http/http.dart" as http;

class NetworkHelper {
  Uri _uri;
  Future<dynamic> getData() async {
    final http.Response response = await http.get(this._uri);
    return jsonDecode(response.body);
  }

  NetworkHelper({@required String uri}) {
    this._uri = Uri.parse(uri);
  }
}
