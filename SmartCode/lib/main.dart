
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SmartCode/routes/routes.dart';


//初始化路由
final Router_all router  = Router_all();

void main() => runApp(MyApp());

final String SUPPLIER_URL = 'http://192.168.0.12';
final String SMART_URL = 'http://192.168.0.13/ws/web/r/awsp900';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute:router.getRoutes,
    );
  }
}