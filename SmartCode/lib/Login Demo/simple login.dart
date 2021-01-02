import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginWidget(),
    );
  }
}

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 55.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 160.0,
                  height: 160.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF66FFEE),
                          Color(0xFF750CFE),
                        ]),
                  ),
                  child: Container(
                    width: 86.0,
                    height: 86.0,
                    child: CustomPaint(
                      painter: LogoPainter(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Ultimate Multi-Purpose\n PSD Template",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF555D70), fontSize: 20.0),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 42.0, right: 42.0, top: 20),
                  child: Container(
                    height: 52.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        color: Color(0xFF5488C4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Login with Digiwin',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        )
                      ],
                    ),
                  )), //登陆diwiwin login按钮
              Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 42.0, right: 42.0),
                  child: Container(
                    height: 100.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        border: Border.all(color: Color(0xFFF1F1F1), width: 1)),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: TextField(
                                  style: TextStyle(fontSize: 13.0),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "UserName",
                                  ),
                                ),
                              )),
                        ),
                        Divider(
                          thickness: 1,
                          indent: 16.0,
                          endIndent: 16.0,
                          height: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: TextField(
                                  style: TextStyle(fontSize: 13.0),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "PassWord",
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  )), //账号密码输入栏位
              Padding(
                padding: EdgeInsets.only(left: 42.0, right: 42.0, top: 24.0),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 52.0,
                  decoration: BoxDecoration(
                      color: Color(0xFF02BED0),
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  child: Text(
                    "Login Now",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ), //登陆按钮
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Container(
                  width: double.infinity,
                  height: 52.0,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Forget your password?",
                            style: TextStyle(
                              color: Color(0xff9B9B9B),
                            )),
                        TextSpan(
                            text: "\nNot A member?",
                            style: TextStyle(
                              color: Color(0xff9B9B9B),
                            ),
                            children:[
                              TextSpan(
                                  text:"Join Today!",
                                  style: TextStyle(
                                    color: Color(0xFF5D86C1),
                                  )
                              )
                            ] ),

                      ])),
                ),
              ) //忘记密码按钮
              //登陆按钮
            ],
          )),
    );
  }
}

class LogoPainter extends CustomPainter {
  Paint _paint;
  LogoPainter()
      : _paint = new Paint()
    ..isAntiAlias = true
    ..color = Colors.white
    ..strokeWidth = 16
    ..strokeCap = StrokeCap.butt
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        10 * pi / 180,
        330 * pi / 180,
        false,
        _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {}
}
