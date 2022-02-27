import 'package:flutter/cupertino.dart';
/**
 * @Author: zhouge
 * @Description: text input 组件
 * @Date: Created in 18:42 2021-01-11
 * @Modified By:
 **/
import 'package:flutter/material.dart';
import 'package:color_dart/color_dart.dart';

/// 输入框组件
class Stand_Input extends StatelessWidget {
  Stand_Input({
    Key key,
    this.preText,
    this.icon,
    this.borderRadius,
    this.padding,
    this.hintext,
    this.width,
    this.height,
    this.onPressed,
    this.rightIcon,
    this.typecolor,
  }) : super(key: key);

  ///框内左侧文字
  final Widget preText;

  ///左侧图标
  final Widget icon;

  ///圆角
  final BorderRadius borderRadius;

  ///边距
  final EdgeInsets padding;

  ///提示文字
  final String hintext;

  /// 高
  final double width;

  /// 宽度
  final double height;

  ///回调
  final VoidCallback onPressed;

  ///右侧图标
  final Widget rightIcon;

  ///主题颜色
  final Color typecolor;

  Color initColor(){
    if(typecolor == null ){
      return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {

    Color _color = initColor();

    return Material(
      key: key,
      textStyle: TextStyle(color: Colors.red),
      borderRadius:
      borderRadius == null ? BorderRadius.circular(2) : borderRadius,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red,width: 1.0 ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(child: icon,),
            Container(
              margin:  EdgeInsets.only(left: icon != null && preText != null ? 6 : 0),
              child: preText,
            ),
            Expanded(
              child: Container(
                child: TextField(
                  decoration: InputDecoration(

                    hintText: hintext,
                    hintStyle: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
