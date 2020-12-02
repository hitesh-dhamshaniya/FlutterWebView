import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'location_model.dart';

class ZomatoClient {
  final _apiKey = "c5cd5fc0cca62822a5f0d3b75d2c1295";
  final _host = 'developers.zomato.com';
  final _contextRoot = 'api/v2.1';

  Map<String, String> get _headers => {'Accept': 'application/json', 'user-key': _apiKey};

  Future<Map> request({@required String path, Map<String, String> parameters}) async {
    final uri = Uri.https(_host, '$_contextRoot/$path', parameters);
    final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(results.body);

    return jsonObject;
  }

  Future<List<Location>> fetchLocations(String query) async {
    final results = await request(path: 'locations', parameters: {'query': query, 'count': '10'});
    final suggestions = results['location_suggestions'];

    return suggestions.map<Location>((json) => Location.fromJson(json)).toList(growable: false);
  }
}
