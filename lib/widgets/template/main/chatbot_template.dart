import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../const/constants.dart';
import '../../molecules/containers/drawer.dart';
import 'dart:async';


class ChatbotTemplate extends StatelessWidget {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  ChatbotTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ask from ChatBot"),
        backgroundColor: Constants.appColorAmber,
      ),

      drawer: DrawerWidget(),

      body: WebView(
        initialUrl: 'http://devindi.smgbw.lk',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
