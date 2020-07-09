import 'package:flutter/material.dart';
import 'package:flutterdemoapp/ui/pages/MainPage.dart';

typedef PageContentBuilder = Widget Function(BuildContext context, {Object arguments});

final routes = <String, PageContentBuilder>{
  "/": (context, {arguments}) => MainPage(arguments: arguments),
};

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  PageContentBuilder pageContentBuilder = routes[routeSettings.name];
  if (pageContentBuilder != null) {
    final arguments = routeSettings.arguments;
    return MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: arguments));
  }
  return null;
}
