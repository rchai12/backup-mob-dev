import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PreviewPage extends StatelessWidget {
  final String previewUrl;

  const PreviewPage({Key? key, required this.previewUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Preview')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(previewUrl)), 
      ),
    );
  }
}