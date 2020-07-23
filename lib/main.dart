import 'package:flutter/material.dart';
import 'package:flutterdemoapp/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurpleAccent,
        accentColor: Colors.cyan,
      ),
//      darkTheme: ThemeData.dark(),
//      themeMode: ThemeMode.dark,
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
    );
  }
}
