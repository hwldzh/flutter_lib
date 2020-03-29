import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_module/main.dart';
import 'package:flutter_module_2/main.dart';


void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  route = route.substring("scheme://".length);
  int index = route.indexOf("?");
  String path = route;
  String query = "";
  if(index != -1) {
    path = route.substring(0, index);
    query = route.substring(index + 1);
  }
  index = path.indexOf("/");
  String module = path.substring(0, index);
  String page = path.substring(index + 1);
  if(module == "flutter_module") {
    return getWidgetFlutterModule(page, query);
  } else if(module == "flutter_module_2") {
    return getWidgetFlutterModule2(page, query);
  } else {
    return Center(
      child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
    );
  }
}
