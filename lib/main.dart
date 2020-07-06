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
        primaryColor: Colors.teal,
        accentColor: Colors.cyan,
      ),
//      darkTheme: ThemeData.dark(),
//      themeMode: ThemeMode.dark,
      initialRoute: "/",
      onGenerateRoute: (RouteSettings routeSettings) {
        PageContentBuilder pageContentBuilder = routes[routeSettings.name];

        print("11111111111111111111111111111---${routeSettings.arguments}");
        if (pageContentBuilder != null) {
          final arguments = routeSettings.arguments;
          Route route;
          if (arguments != null) {
            print("不为空");
            route = MaterialPageRoute(builder: pageContentBuilder(context, arguments: arguments));
          } else {
            print("为空");
            route = MaterialPageRoute(builder: pageContentBuilder(context));
          }
          print("222222222222222222$route");
          return route;
        }
        return null;
      },
    );
  }
}
