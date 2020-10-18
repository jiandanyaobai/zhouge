import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 17:40 2020-10-11
 * @Modified By:
 **/

//通用组件
class ComponentTabData {
  ComponentTabData({
    this.description,
    this.tabName,
  });

  final String tabName;
  final String description;
}

// 通用组件二
class TabbedComponentScaffold extends StatelessWidget {
  //构造函数
  const TabbedComponentScaffold({
    this.title,
    this.demos,
    this.isScrollable = true,
    this.actions,
    this.showExampleCodeAction = true,
  });

  final List<ComponentTabData> demos;
  final String title;
  final List<Widget> actions;
  final bool isScrollable;
  final bool showExampleCodeAction;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: demos.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              actions: <Widget>[
                Icon(Icons.location_searching),
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.library_books,
                          semanticLabel: 'Show documentation'),
                      onPressed: () {print('这个是测试！');},
                    );
                    },
                )
              ],
            ),
            body:TabBarView(
              children: demos.map<Widget>((ComponentTabData demo) {
                return SafeArea(
                  top: false,
                  bottom: false,
                  child: Text('我是周哥'),

                );
              }),
            )

        )
    );
  }
}
