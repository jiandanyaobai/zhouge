/// @Author: zhouge
/// @Description: 按钮组件封装
/// @Date: Created in 16:38 2021-05-05
/// @Modified By:
///*/
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key key,
    this.color = Colors.black,
    this.textcolor = Colors.white,
    this.cb,
    this.text = "按钮",
    this.bgcolor = Colors.red,
    this.textsize = 14.0,
    this.buttonwidth = 60,
  }) : super(key: key);

  final Color color;
  final String text;
  final Object cb;
  final Color bgcolor;
  final Color textcolor;
  final double textsize;
  final double buttonwidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.cb,
      child: Container(
        height: 40.0,
        width: this.buttonwidth,
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: this.bgcolor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(color: this.textcolor, fontSize: this.textsize),
          ),
        ),
      ),
    );
  }
}
