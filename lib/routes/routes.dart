import 'package:flutter/material.dart';
import 'package:flutterdemoapp/ui/pages/MainPage.dart';
import 'package:flutterdemoapp/ui/pages/mine/Mine1.dart';
import 'package:flutterdemoapp/ui/pages/mine/Mine2.dart';

typedef PageContentBuilder = Widget Function(BuildContext context, {Object arguments});

class Pages {
  static const ROOT = "/";
  static const MINE1 = "mine1";
  static const MINE2 = "mine2";
}

final routes = <String, PageContentBuilder>{
  Pages.ROOT: (context, {arguments}) => MainPage(arguments: arguments),
  Pages.MINE1: (context, {arguments}) => Mine1(),
  Pages.MINE2: (context, {arguments}) => Mine2(),
};

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  PageContentBuilder pageContentBuilder = routes[routeSettings.name];
  if (pageContentBuilder != null) {
    final arguments = routeSettings.arguments;
    return MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: arguments));
  }
  return null;
}
