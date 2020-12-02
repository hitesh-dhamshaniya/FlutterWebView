import 'dart:async';

import 'package:flutter_webview_demo/BloC/bloc.dart';
import 'package:flutter_webview_demo/data/constants.dart';
import 'package:flutter_webview_demo/data/location_model.dart';

class LocationQueryBloc implements Bloc {
  final _controller = StreamController<List<Location>>();
  final _client = ZomatoClient();

  Stream<List<Location>> get locationStream => _controller.stream;

  void submitQuery(String query) async {
    //1
    final result = await _client.fetchLocations(query);
    _controller.sink.add(result);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
