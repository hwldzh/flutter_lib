import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_module/main.dart' as flutter_module;
import 'package:flutter_module_2/main.dart' as flutter_module_2;


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
    return flutter_module.getWidgetFlutterModule(page, query);
  } else if(module == "flutter_module_2") {
    return flutter_module_2.getWidgetFlutterModule(page, query);
  } else {
    return Center(
      child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
    );
  }
}
