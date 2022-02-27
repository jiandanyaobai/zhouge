
/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 14:09 2021-07-03
 * @Modified By:
 **/

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Counter with ChangeNotifier,DiagnosticableTreeMixin{

  int _count = 10;  //状态

  int get count => _count;    //获取状态

  //更新状态
  void intCount(){
    this._count++;
    notifyListeners();  //表示更新状态
  }
}