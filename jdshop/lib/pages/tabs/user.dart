import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          height: ScreenUtil().setHeight(120.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/user_bg.jpg'), fit: BoxFit.cover)),
          child: Row(
            children: [
              Container(
                child: ClipOval(
                    child: Image.asset('images/user.png',
                        fit: BoxFit.cover, width: 68, height: 68)),
              ),
              SizedBox(width: 20.0),
              Expanded(
                  child: InkWell(
                    child: Text('登陆/注册', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  flex: 1)
            ],
          ),
        ),
        ListTile(
            leading: Icon(Icons.assignment, color: Colors.red),
            title: Text("全部订单")),
        Divider(),
        ListTile(
            leading: Icon(Icons.payment, color: Colors.green),
            title: Text("待付款")),
        Divider(),
        ListTile(
            leading: Icon(Icons.local_car_wash, color: Colors.orange),
            title: Text("待收货")),
        Divider(),
        ListTile(
            leading: Icon(Icons.favorite, color: Colors.lightGreen),
            title: Text("我的收藏")),
        Divider(),
        ListTile(
            leading: Icon(Icons.people, color: Colors.black54),
            title: Text("在线客服"))
      ],
    ));
  }
}
