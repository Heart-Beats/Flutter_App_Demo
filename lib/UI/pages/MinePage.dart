import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("我的"),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        body: Text("我的主页"));
  }
}
