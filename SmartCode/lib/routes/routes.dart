
/**
 * @Author: zhouge
 * @Description: 路由
 * @Date: Created in 19:38 2021-01-02
 * @Modified By:
 **/

import 'package:SmartCode/Pages/login/LoginPage.dart';
import 'package:SmartCode/Pages/Purchasepage.dart';
import 'package:SmartCode/Pages/Salespage.dart';
import 'package:SmartCode/Pages/WareHousePage.dart';
import 'package:SmartCode/Pages/Workpage.dart';
import 'package:flutter/material.dart';
import 'package:SmartCode/Pages/Settingpage.dart';

class Router {
  //路由设置

  static final _routes = {
    "/": (context,{Object args}) => LoginPages(),
    'settings': (context,{Object args}) => SettingPages(),
    '/purchase': (context,{Object args}) => PurchasePages(),
    '/sales': (context,{Object args}) => SalesPages(),
    '/warehouse': (context,{Object args}) => WareHousePages(),
    '/work': (context,{Object args}) => WorkPages(),
  };

  //监听route，类似于拦截器原理
  Function onGenerateRoute = (RouteSettings settings) {
    final String routeName = settings.name;
    final Function builder = Router._routes[routeName];

    //打印路由信息，验证是否OK
    print(settings);

    //判定路由状态并返回
    if (builder == null) {
      return null;
    } else {
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) =>
              builder(context, args: settings.arguments));
    }
  };
}
