/**
 * @Author: zhouge
 * @Description: 按钮组件封装
 * @Date: Created in 16:38 2021-05-05
 * @Modified By:
 **/
import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {


  const MyButton({
    Key key,
    this.color = Colors.black,
    this.cb = null,
    this.text = "按钮",
    this.bgcolor = Colors.red,
  }):super(key:key);

  final Color color;
  final String  text;
  final Object cb;
  final Color bgcolor;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width:60,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: this.bgcolor,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Center(
        child: Text(
          this.text,
          style: TextStyle(color: this.color),

        ),
      ),
    );
  }
}
