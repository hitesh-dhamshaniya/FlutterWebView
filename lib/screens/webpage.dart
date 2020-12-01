import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class WebPage extends StatefulWidget {
  String mWebSiteURL;

  WebPage(this.mWebSiteURL);

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    print("In WebPage URL is ${widget.mWebSiteURL} ");
    return Scaffold(
      appBar: AppBar(
        title: Text("Load web contain"),
      ),
      body: Column(
        children: [
          Expanded(
              child: WebView(
            initialUrl: widget.mWebSiteURL,
          ))
        ],
      ),
    );
  }
}
