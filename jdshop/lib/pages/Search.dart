/**
 * @Author: zhouge
 * @Description: 查询框的实现
 * @Date: Created in 10:34 2021-01-24
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/SearchServices.dart';

class SearchPage extends StatefulWidget {
  Map arguments;
  SearchPage({Key key, this.arguments}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _keywords;
  List _historyListData = [];

  @override
  void initState() {
    super.initState();
    this._getHistoryData();
  }

  //弹出对话框
  _alertDialog(keywords) async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示信息！'),
            content: Text("您确认要删除吗？"),
            actions: [
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  print('取消');
                  Navigator.pop(context, 'Cancle');
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  print('${keywords}');
                  SearchServices.removeHistoryList('${keywords}');
                  this._getHistoryData();
                  Navigator.pop(context, 'Ok');
                },
              ),
            ],
          );
        });
  }

  // 获取本地缓存的中的数据
  _getHistoryData() async {
    var _historyListData = await SearchServices.getSearchList();
    setState(() {
      this._historyListData = _historyListData;
    });
  }

  //缓存列表、历史记录单独进行封装
  Widget _historyListWidget() {
    this._getHistoryData();
    if (_historyListData.length > 0) {
      return Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              '历史记录',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Column(
            children: this._historyListData.map((value) {
              return Column(
                children: [
                  ListTile(
                    title: Text('${value}'),
                    onLongPress: () {
                      print("现有的值是" + '${value}');
                      this._alertDialog('${value}');
                    },
                  ),
                  Divider(height: 0.0),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 40.0),
          Container(
              alignment: Alignment.center,
              width: 160.0,
              height: ScreenUtil().setHeight(40.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color.fromRGBO(233, 233, 233, 0.8),
                    width: 1.0,
                  )),
              child: InkWell(
                onTap: () {
                  SearchServices.clearHistoryList();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete),
                    Text('删除历史记录'),
                  ],
                ),
              ))
        ],
      );
    } else {
      return Text("");
    }
  }

  // 构建函数
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: TextField(
              onChanged: (value) {
                this._keywords = value;
              },
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
            height: ScreenUtil().setHeight(40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(233, 233, 233, 0.8)),
          ),
          actions: [
            InkWell(
              onTap: () {
                SearchServices.setSearchData(this._keywords);
                //Navigator.pushNamed(context, '/productlist', arguments: {"keywords": this._keywords});
              },
              child: Container(
                height: ScreenUtil().setHeight(68),
                width: ScreenUtil().setWidth(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "搜索",
                      style: TextStyle(fontSize: 16.0),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "热搜",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: ScreenUtil().setWidth(60),
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                  ),
                  child: Text('女装'),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: ScreenUtil().setWidth(60),
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                  ),
                  child: Text('笔记本电脑'),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: ScreenUtil().setWidth(60),
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                  ),
                  child: Text('鞋子'),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: ScreenUtil().setWidth(60),
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                  ),
                  child: Text('电脑'),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: ScreenUtil().setWidth(80),
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                  ),
                  child: Text('老年鞋子'),
                ),
              ],
            ),
            Divider(
              height: 1.0,
            ),
            // 历史记录
            _historyListWidget(),
          ],
        ));
  }
}
