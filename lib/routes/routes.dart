import 'package:flutter/material.dart';
import 'package:flutterdemoapp/ui/pages/MainPage.dart';

typedef PageContentBuilder = WidgetBuilder Function(BuildContext context, {Object arguments});

final routes = <String, PageContentBuilder>{
  "/": (context, {arguments}) => (context) {
        print("3333333333333333333333-->$arguments");
        if (arguments != null) {
          return MainPage(
            arguments: arguments,
          );
        } else {
          return MainPage();
        }
      }
};
