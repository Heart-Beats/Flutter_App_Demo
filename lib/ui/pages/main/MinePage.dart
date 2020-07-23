import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: Colors.teal,
        child: Text("测试路由"),
        onPressed: () => Navigator.pushNamed(context, Pages.MINE1),
      ),
    );
  }
}
