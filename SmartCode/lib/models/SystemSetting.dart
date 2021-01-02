/**
 * @Author: zhouge
 * @Description:  设置界面模拟数据
 * @Date: Created in 19:03 2020-10-25
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import '../config/conf.dart' show AppColors,Constants;

// 构造功能函数
class FullIconButton extends StatelessWidget {

  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;


  final String avatar;
  final String title;
  final String devicesinfo;
  final VoidCallback onPressed;

  FullIconButton({
    this.title,
    this.avatar,
    this.devicesinfo,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    //定义单个widget的属性
    final _settingWidget = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(avatar,width: 20.0,height: 20.0,),
        SizedBox(width: 10.0,),
        Text(title),
        Expanded(child: Text(''),),
        Text(devicesinfo),
      ],
    );

    // 返回整个容器的属性
    return Container(
      decoration:BoxDecoration(
        border:Border(
          bottom:BorderSide(width: Constants.DividerWidth,color: Color(AppColors.DividerColor))
        )
      ),
      child: FlatButton(
        padding: const EdgeInsets.only(
          left: HORIZONTAL_PADDING, right: HORIZONTAL_PADDING,
          bottom: VERTICAL_PADDING, top: VERTICAL_PADDING,
        ),
        onPressed: onPressed,
        child: _settingWidget,
      ),
    );
  }
}




