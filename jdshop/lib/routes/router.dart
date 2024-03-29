/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 22:26 2021-01-16
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:jdshop/pages/ProductContent.dart';
import 'package:jdshop/pages/Search.dart';
import 'package:jdshop/pages/tabs/cart.dart';
import 'package:jdshop/pages/tabs/tab.dart';
import '../pages/ProductList.dart';
import '../pages/Login.dart';
import '../pages/RegisterFirst.dart';
import '../pages/RegisterSec.dart';

// 配置路由
final routes = {
  '/': (context) => Tabs(),
  '/cart': (context) => CartPage(),
  '/productList': (context, {Object arguments}) =>
      ProductListPage(arguments: arguments),
  '/search': (context, {Object arguments}) => SearchPage(arguments: arguments),
  '/productContent': (context, {Object arguments}) =>
      ProductContentPage(arguments: arguments),
  '/login': (context, {Object arguments}) => LoginPage(arguments: arguments),
  '/RegisterFirst': (context) => RegisterFirst(),
  '/RegisterSec': (context, {Object arguments}) =>
      RegisterSec(arguments: arguments)
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  ///统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
