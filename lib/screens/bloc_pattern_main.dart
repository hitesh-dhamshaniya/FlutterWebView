import 'package:flutter/material.dart';
import 'package:flutter_webview_demo/BloC/bloc_provider.dart';
import 'package:flutter_webview_demo/BloC/location_bloc.dart';
import 'package:flutter_webview_demo/screens/location_screen.dart';

class BloCMainScreen extends StatefulWidget {
  @override
  _BloCMainScreenState createState() => _BloCMainScreenState();
}

class _BloCMainScreenState extends State<BloCMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern Demo"),
      ),
      body: BlocProvider<LocationBloc>(bloc: LocationBloc(), child: LocationScreen()),
    );
  }
}
