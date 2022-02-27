/**
 * @Author: zhouge
 * @Description: 登陆界面
 * @Date: Created in 19:57 2021-01-02
 * @Modified By:
 **/

import 'package:flutter/material.dart';

//登陆界面的首页
class LoginPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 120.0),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      'Welcome To\n   Digiwin！',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 50.0,),
                LoginInput(),
                SizedBox(height: 20.0,),
              ])),
    );
  }
}

// 登陆界面的输入栏位
class LoginInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  SizedBox( width: 5.0,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: '请输入账号',
                          icon: Icon(Icons.person),
                          border: InputBorder.none),
                    ),
                  )
                ],
              )),
          Divider(height: 1.0, indent: 0.0,),
          SizedBox(height: 5.0,),
          Container(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 5.0,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                      hintText: '请输入密码',
                      icon: Icon(Icons.remove_red_eye),
                      border: InputBorder.none),
                ),
              ),
            ],
          )),
          Divider(height: 1.0, indent: 0.0,),
          SizedBox(height: 20.0),
          Container(
            height: 40.0,
            width: double.infinity,
            child: FlatButton(
              color: Colors.amber,
              onPressed: () {
                print('登陆');
                Navigator.pushNamed(context, '/home');
              },
              child: Text('立即登陆', style: TextStyle(fontSize: 18.0)),
            ),
          )
        ],
      ),
    );
  }
}
