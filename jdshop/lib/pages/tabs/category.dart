/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 22:13 2021-01-16
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import '../../config/config.dart';
import 'package:jdshop/model/CateModel.dart';

class CateGory extends StatefulWidget {
  @override
  _CateGoryState createState() => _CateGoryState();
}

class _CateGoryState extends State<CateGory>
    with AutomaticKeepAliveClientMixin {
  //状态保持组件
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  int _selectIndex = 0;
  List _leftCateList = [];
  List _rightCateList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getLeftCateList();
  }

  //获取左侧分类
  _getLeftCateList() async {
    var url = "${Config.domain}api/pcate";
    var result = await Dio().get(url);
    var leftCateList = CateModel.fromJson(result.data);
    setState(() {
      this._leftCateList = leftCateList.result;
    });
    this._getRightCateList(this._leftCateList[0].sId);
  }

  //获取右侧分类
  _getRightCateList(pid) async {
    var url = "${Config.domain}api/pcate?pid=${pid}";
    var result = await Dio().get(url);
    var rightCateList = CateModel.fromJson(result.data);
    setState(() {
      this._rightCateList = rightCateList.result;
      print(result);
    });
  }

  ///左侧组件
  Widget _leftCateWidget(leftWidth) {
    return Container(
      height: double.infinity,
      width: leftWidth,
      child: ListView.builder(
          itemCount: _leftCateList.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectIndex = index;
                      this._getRightCateList(this._leftCateList[index].sId);
                    });
                  },
                  child: Container(
                    child: Text(
                      "${this._leftCateList[index].title}",
                      textAlign: TextAlign.center,
                    ),
                    color: _selectIndex == index
                        ? Color.fromRGBO(240, 246, 246, 0.9)
                        : Colors.white,
                    width: double.infinity,
                    height: ScreenUtil().setHeight(60),
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                ),
                Divider(
                  height: 1.0,
                )
              ],
            );
          }),
    );
  }

  ///右侧组件
  Widget _rightCateWidget(rightItemWidth, rightItemHeight) {
    if (this._rightCateList.length > 0) {
      return Expanded(
        child: Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, 0.9),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: rightItemWidth / rightItemHeight,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: this._rightCateList.length,
                itemBuilder: (context, index) {
                  ///处理图片
                  String pic = this._rightCateList[index].pic;
                  pic = Config.domain + pic.replaceAll('\\', '/');

                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/productList',
                          arguments: {"cid": this._rightCateList[index].sId});
                    },
                    child: Container(
                      height: double.infinity,
                      child: Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network("${pic}", fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Container(
                              height: ScreenUtil().setHeight(28),
                              child:
                                  Text('${this._rightCateList[index].title}'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
      );
    } else {
      return Expanded(
        flex: 1,
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(10),
          color: Color.fromRGBO(240, 246, 246, 0.9),
          child: Text('加载中'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //计算右侧GridView的宽搞比
    var leftWidth = ScreenUtil().screenWidth / 4;

    /// 右侧宽度 = 总宽度 - 左侧宽度 - GridView外层元素padding - Gridview中间的间距
    var rightItemWidth = (ScreenUtil().screenWidth - leftWidth - 20 - 20) / 3;

    ///长和宽1:1显示，利用宽度计算长度
    rightItemWidth = ScreenUtil().setWidth(rightItemWidth);

    /// 右侧每一项的高度
    var rightItemHeight = rightItemWidth + ScreenUtil().setHeight(28);

    return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon:
              Icon(Icons.center_focus_weak, size: 28, color: Colors.black87),
              onPressed: null,
            ),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Container(
                height: ScreenUtil().setHeight(36),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.8),
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text(
                      '笔记本',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.message, size: 28, color: Colors.black87),
                onPressed: null,
              )
            ],
          ),
          body: Row(children: <Widget>[
            _leftCateWidget(leftWidth),
            _rightCateWidget(rightItemWidth, rightItemHeight)

            /// 右侧列表
          ])
    );
  }
}
