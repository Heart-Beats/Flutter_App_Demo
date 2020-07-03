import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("其他"),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        body: Text("其他主页"));
  }
}
