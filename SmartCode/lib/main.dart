
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';

void main() => runApp(MyApp());

final String SUPPLIER_URL = 'http://192.168.0.12';
final String SMART_URL = 'http://192.168.0.13/ws/web/r/awsp900';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: HomeSettingPage(),
    );
  }
}

// 输入栏位
class InputWidget extends StatelessWidget {
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
                  SizedBox(
                    width: 5.0,
                  ),
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
          Divider(
            height: 1.0,
            indent: 0.0,
          ),
          SizedBox(height: 20.0),
          Container(
            height: 40.0,
            width: double.infinity,
            child: FlatButton(
              color: Colors.amber,
              onPressed: () {
                //这个是一般的路由情况
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePages()));
              },
              child: Text('立即登陆', style: TextStyle(fontSize: 18.0)),
            ),
          )
        ],
      ),
    );
  }
}

// 弹出层的设置
class DialogDemoItem extends StatelessWidget {
  //定义常量
  final String title;
  final String supplieraddress;
  final String smartaddress;
  final VoidCallback onPressed;

  const DialogDemoItem({
    Key key,
    this.title,
    this.supplieraddress,
    this.smartaddress,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title),
          Text(supplieraddress),
          Text(smartaddress),
        ],
      ),
    );
  }
}

class HomeSettingPage extends StatefulWidget {
  @override
  _HomeSettingPageState createState() => _HomeSettingPageState();
}

class _HomeSettingPageState extends State<HomeSettingPage> {

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    );
  }

  bool CHECKTOP = false; // 正式区
  bool CHECKTST = true; // 测试区

  Widget buildCheckbox1() {
    return Container(
        width: double.infinity,
        child: FlatButton(
          onPressed: () {
            showDemoDialog<String>(
                context: context,
                child: SimpleDialog(
                  title: const Text(
                    '系统设置',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  titlePadding: EdgeInsets.only(top: 15.0, bottom: 2.0),
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: CHECKTOP,
                          onChanged: (bool value) {
                            setState(() {
                              CHECKTOP = value;
                            });
                          },
                        ),
                        Text('正式区')
                      ],
                    ),
                    Text('供应商: ${SUPPLIER_URL}'),
                    Text('供应商: ${SMART_URL}'),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: CHECKTST,
                          tristate: false,
                          onChanged: (bool value) {
                            setState(() {
                              CHECKTST = value;
                            });
                          },
                        ),
                        Text('测试区'),
                      ],
                    ),
                    Text('供应商: ${SUPPLIER_URL}'),
                    Text('供应商: ${SMART_URL}'),
                    Row(
                      children: <Widget>[
                        Text('语言别'),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('简体中文'),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('繁体中文'),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('English'),
                      ],
                    ),
                    FlatButton(
                      child: Text('确认'),
                      onPressed: () {
                        print('确认');
                      },
                    )
                  ],
                ));
          },
          child: Container(
            child: Text(
              '系统设置',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ));
  }
  Widget buildCheckbox() {
    return Container(
      child: FlatButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Scaffold(
                body: Container(
                  child: Text('123'),
                ),
              );
            },
          );
        },
        child: Text('系统设置'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final List<DialogDemos> demos = [
      DialogDemos(title:'1',name:'周哥',old: '18'),
      DialogDemos(title:'2',name:'胡哥',old: '20'),
      DialogDemos(title:'3',name:'胡哥',old: '21'),
      DialogDemos(title:'4',name:'胡哥',old: '22'),
      DialogDemos(title:'5',name:'胡哥',old: '23'),
      DialogDemos(title:'6',name:'胡哥',old: '25'),
    ];

    var size = MediaQuery.of(context).size;
    print(size);
    print('map ###########################');
    demos.map((DialogDemos demos) => print(demos.title)).toList();
    print('forEach ###########################');
    demos.forEach((v) => print(v.title));
    print('for ###########################');
    for(var i =0; i<demos.length; i++){
      print(demos[i].title);
    }

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
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                InputWidget(),
                SizedBox(
                  height: 20.0,
                ),
                buildCheckbox1(),
              ])),
    );
  }
}

// 数组测试
class DialogDemos {

  DialogDemos({
    this.demoWidget,
    this.title,
    this.name,
    this.old,
  });

  final Widget demoWidget;
  final String title;
  final String name;
  final String old;

}