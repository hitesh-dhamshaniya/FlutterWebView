import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_demo/screens/webpage.dart';

import 'bloc_pattern_main.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final websiteUrl = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter WebView")),
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: TextFormField(
                controller: websiteUrl,
                style: TextStyle(fontSize: 30.0),
                decoration: InputDecoration(labelText: "Enter Website URL"),
                onChanged: (value) => () {
                  print("Value ==> $value");
                  websiteUrl.text = value.toString();
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter website address";
                  }
                  return null;
                },
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Load URL",
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print("URL :$websiteUrl");
                  Navigator.push(context, MaterialPageRoute(builder: (con) => WebPage(this.websiteUrl.text.toString())));
                } else {
                  print("Form not validate-");
                }
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BloCMainScreen()));
              },
              child: Text("Load Bloc Example"),
            ),
          ],
        ),
      )),
    );
  }
}
