/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 23:02 2021-07-16
 * @Modified By:
 **/

import 'package:event_bus/event_bus.dart';

// bus 初始化

EventBus eventBus = EventBus();

class ProductContentEvent{
  String str;

  // 构造函数
  ProductContentEvent(String str){
    this.str = str;
  }

  }