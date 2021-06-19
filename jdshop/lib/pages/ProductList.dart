import 'package:flutter/cupertino.dart';
/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 12:15 2021-01-19
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:jdshop/config/config.dart';
import '../model/ProductModel.dart';
import '../widget/loadingWidget.dart';

// ignore: must_be_immutable
class ProductListPage extends StatefulWidget {
  Map arguments;
  ProductListPage({Key key, this.arguments}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  //
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //定义分页数据
  int _page = 1;

  //数据合集
  List  _productList = [];

  //拍讯
  String _sort = '';

  // 获取商品列表的数据
  _getProductListData() async {
    var url ="${Config.domain}api/plist?cid=${widget.arguments["cid"]}&page=1&sort=${this._sort}";
    var result = await Dio().get(url);
    var productList = ProductModel.fromJson(result.data);

    setState(() {
      //this._productList = productList.result;     //返回Map， 数据在result中
      this._productList.addAll(productList.result);
    });
  }

  @override
  void initState(){
    super.initState();
    this._getProductListData();
  }
  /// 商品列表
  Widget _productListWidget() {
     //this._getProductListData();
    if (this._productList.length > 0){
      return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: this._productList.length,
            itemBuilder: (context, index) {

              String  pic = this._productList[index].pic;
              pic = Config.domain+pic.replaceAll('\\', '/');

              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: ScreenUtil().setWidth(100),
                        height: ScreenUtil().setHeight(100),
                        child: Image.network(
                          '${pic}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: ScreenUtil().setHeight(100),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${this._productList[index].title}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: ScreenUtil().setHeight(20),
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(
                                            230, 230, 230, 0.9)
                                    ),
                                    child: Text(
                                      '4g', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(20),
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(
                                            230, 230, 230, 0.9)
                                    ),
                                    child: Text(
                                      '智能手机', style: TextStyle(fontSize: 12),),
                                  ),
                                ],),
                              Text(
                               '${this._productList[index].price}',
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(height: 16,)
                ],
              );
            }),
      );
  }else{
      return LoadingWidget();
    }
  }

  // 筛选浮动导航
  Widget _subHeaderWidget(){
    return  Positioned(
      top: 0,
      height: ScreenUtil().setHeight(40),
      width: ScreenUtil().screenWidth,
      //width: ScreenUtil().setWidth(750),
      child: Container(
        height: ScreenUtil().setHeight(40),
        width: ScreenUtil().screenHeight,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1,color:Color.fromRGBO(233, 233, 233, 0.9)
                )
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex:1,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding:EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(10), 0, ScreenUtil().setHeight(10)),
                  child: Text('综合',textAlign: TextAlign.center,),),
              ),
            ),
            Expanded(
              flex:1,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding:EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(10), 0, ScreenUtil().setHeight(10)),
                  child: Text('销量',textAlign: TextAlign.center,),),
              ),
            ),
            Expanded(
              flex:1,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding:EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(10), 0, ScreenUtil().setHeight(10)),
                  child: Text('价格',textAlign: TextAlign.center,),),
              ),
            ),
            Expanded(
              flex:1,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding:EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(10), 0, ScreenUtil().setHeight(10)),
                  child: Text('筛选',textAlign: TextAlign.center,),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表明细'),
      ),
      body: Stack(
        children: <Widget>[
          _productListWidget(),
          _subHeaderWidget(),
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          child: Text('抽屉框'),
        ),
      )
    );
  }
}