import 'package:flutter/material.dart';
import 'package:flutterdemoapp/main.dart';

class DynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("动态"),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        body: Text("动态主页"),
    );
  }
}
