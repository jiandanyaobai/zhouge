/**
 * @Author: zhouge
 * @Description:  路由首页
 * @Date: Created in 21:33 2020-12-28
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:SmartCode/Pages/Purchasepage.dart';

class Router{
  static final  _routes = {
    '/' : (BuildContext context, {Object args }) =>  PurchasePages(),
  };


}

