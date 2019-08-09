/**
 * author:
 * time:2019/8/7
 * descript:
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

typedef void TextViewCreatedCallback(TextViewController controller);

class TextViewWidget extends StatefulWidget {

  const TextViewWidget({
    Key key,
    this.onTextViewCreated,
  }) : super(key: key);

  final TextViewCreatedCallback onTextViewCreated;

  @override
  _TextViewWidgetState createState() => _TextViewWidgetState();
}

class _TextViewWidgetState extends State<TextViewWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AndroidView(viewType: "plugins.felix.angelov/textview",onPlatformViewCreated: _onPlatformViewCreated,),
    );
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onTextViewCreated == null) {
      return;
    }
    widget.onTextViewCreated(new TextViewController._(id));
  }
}

class TextViewController {
  TextViewController._(int id)
      : _channel = new MethodChannel('plugins.felix.angelov/textview_$id');

  final MethodChannel _channel;

  Future<void> setText(String text) async {
    assert(text != null);
    return _channel.invokeMethod('setText', text);
  }
}