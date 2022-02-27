
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
import 'package:SmartCode/Pages/purchase/quickpurchase.dart';
import 'package:flutter/material.dart';
import 'package:SmartCode/Pages/Settingpage.dart';
import 'package:SmartCode/Homepage.dart';

class Router_all {
  //路由设置

   static final _routes = {
    "/": (BuildContext context,{Object args}) => LoginPages(),
    '/settings': (BuildContext context,{Object args}) => SettingPages(),
    '/purchase': (BuildContext context,{Object args}) => PurchasePages(),
    '/sales': (BuildContext context,{Object args}) => SalesPages(),
    '/warehouse': (BuildContext context,{Object args}) => WareHousePages(),
    '/work': (BuildContext context,{Object args}) => WorkPages(),
    '/home': (BuildContext context,{Object args}) => HomePages(),
    '/quick-receive': (BuildContext context,{Object args}) => quickPurchase(args: args,),
    '/purchase-receive': (BuildContext context,{Object args}) => quickPurchase(args: args,),
  };

   //监听route，类似于拦截器原理

   /// 监听route，返回路由对象
   Route getRoutes(RouteSettings settings) {
     String routeName = settings.name;
     final Function builder = Router_all._routes[routeName];

     print(settings);

     if(builder == null) {
       return null;
     } else {
       return MaterialPageRoute(
           settings: settings,
           builder: (BuildContext context) => builder(context, args: settings.arguments)
       );
     }
   }
}
