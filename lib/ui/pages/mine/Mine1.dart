import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class Mine1 extends StatefulWidget {
  @override
  _mine1State createState() => _mine1State();
}

class _mine1State extends State<Mine1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的第一个页面"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                MaterialButton(
                  color: Colors.teal,
                  child: Text("测试替换路由"),
                  onPressed: () => Navigator.pushReplacementNamed(context, Pages.MINE2),
                ),
                MaterialButton(
                    color: Colors.teal,
                    child: Text("测试根路由"),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(context, Pages.MINE2, (route) => false)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
