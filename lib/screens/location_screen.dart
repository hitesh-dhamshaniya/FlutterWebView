import 'package:flutter/material.dart';
import 'package:flutter_webview_demo/BloC/bloc_provider.dart';
import 'package:flutter_webview_demo/BloC/location_query_bloc.dart';
import 'package:flutter_webview_demo/data/location_model.dart';

class LocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;

  const LocationScreen({Key key, this.isFullScreenDialog = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blocProvider = LocationQueryBloc();
    return BlocProvider(
      bloc: blocProvider,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Where do you want to eat?"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a location',
                ),
                onChanged: (query) => blocProvider.submitQuery(query),
              ),
            ),
            Expanded(child: _buildResult(blocProvider))
          ],
        ),
      ),
    );
  }

  _buildResult(LocationQueryBloc blocProvider) {
    return StreamBuilder<List<Location>>(
        stream: blocProvider.locationStream,
        builder: (context, snapshot) {
          //1
          final result = snapshot.data;

          if (result == null) {
            return Center(child: Text("Enter Location"));
          }

          if (result.isEmpty) {
            return Center(child: Text("No Results"));
          }

          return _buildSearchResult(result);
        });
  }

  _buildSearchResult(List<Location> result) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final location = result[index];
          return ListTile(
            title: Text(location.title),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: result.length);
  }
}
