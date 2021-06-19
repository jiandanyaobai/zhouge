/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 22:26 2021-01-16
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:jdshop/pages/ProductContent.dart';
import 'package:jdshop/pages/Search.dart';
import 'package:jdshop/pages/tabs/tab.dart';
import '../pages/ProductList.dart';


// 配置路由
final routes = {
  '/': (context) => Tabs(),
  '/productList': ( context,{Object arguments} ) => ProductListPage(arguments: arguments,),
  '/search':  (context,{Object arguments}) =>SearchPage(arguments:arguments,),
  '/productContent':  (context,{Object arguments}) =>ProductContentPage(arguments:arguments),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  ///统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  print(settings);
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
