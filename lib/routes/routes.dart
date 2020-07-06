import 'package:flutter/material.dart';
import 'package:flutterdemoapp/ui/pages/MainPage.dart';

typedef PageContentBuilder = Widget Function(BuildContext context, {Object arguments});

final routes = <String, PageContentBuilder>{
  "/": (BuildContext context, {Object args}) {
    return MainPage(arguments: args);
  },
};

Widget test(BuildContext context, {Object args}) {
  PageContentBuilder pageContentBuilder2 = test;
  return MainPage(arguments: args);
}

final onGenerateRoute = (RouteSettings routeSettings) {
  PageContentBuilder pageContentBuilder = routes[routeSettings.name];
  print("11111111111111111111111111111---${routeSettings.arguments}");
  if (pageContentBuilder != null) {
    final arguments = routeSettings.arguments;
//    return MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: arguments));
    if (arguments != null) {
      print("不为空");
      return MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: arguments));
    } else {
      print("为空");
      return MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    }
  }
  return null;
};
