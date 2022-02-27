/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 14:30 2021-05-05
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/ProductContent/ProductContentFirst.dart';
import '../pages/ProductContent/ProductContentSecond.dart';
import '../pages/ProductContent/ProductContentThird.dart';
import '../widget/myButton.dart';
import 'package:dio/dio.dart';
import '../model/ProductContentModel.dart';
import '../config/config.dart';
import '../widget/loadingWidget.dart';
import '../services/EventBus.dart';
import '../services/CarServices.dart';
import '../provider/Cart.dart';
import 'package:provider/provider.dart';

class ProductContentPage extends StatefulWidget {
  // 构造函数
  final Map arguments;
  ProductContentPage({Key key, this.arguments}) : super(key: key);

  @override
  _ProductContentPageState createState() => _ProductContentPageState();
}

class _ProductContentPageState extends State<ProductContentPage> {

  ProductContentItem _productContentData;
  List _productContentList = [];

  var cartProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getContentData();
  }
  // 请求数据
  _getContentData() async  {
    // http://jd.itying.com/api/pcontent?id=59f6a2d27ac40b223cfdcf81
    // api请求接口
    var api = '${Config.domain}api/pcontent?id=${widget.arguments['id']}';
    print(api);
    var result = await Dio().get(api);
    var productContent = ProductContentModel.fromJson(result.data);
    setState(() {
      this._productContentList.add(productContent.result);
    });
  }

  @override
  Widget build(BuildContext context) {
    this.cartProvider = Provider.of<Cart>(context); //监听cart的状态
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(220.0),
                      child: TabBar(
                        indicatorColor: Colors.red,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Tab(child: Text('商品'),),
                          Tab(child: Text('详情'),),
                          Tab(child: Text('评价'),),
                        ],
                      ),
                    )
                  ],
                ),
              actions: [
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: (){
                    showMenu(
                        context: context, 
                        position: RelativeRect.fromLTRB(
                            ScreenUtil().setWidth(16), 40, 6, 0),
                        items: [
                          PopupMenuItem(
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.home),
                                  Text('首页'),
                                ],
                              )
                          ),
                          PopupMenuItem(
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.search),
                                  Text('搜查'),
                                ],
                              )
                          ),
                        ]);
                  },
                ),
              ],

            ),
            body: this._productContentList.length >0 ? Stack(
              children: [
                TabBarView(
                  children: [
                    ProductContentFirst(this._productContentList),
                    ProductContentSecond(this._productContentList),
                    ProductContentThird(this._productContentList),
                  ],
                ),
                Positioned(
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setHeight(80),
                  bottom: 0,
                  child: Container(
                    height: 600,
                    decoration: BoxDecoration(
                      border: Border(
                        top:BorderSide(
                          color: Colors.white,
                          width: 1,
                        )
                      )
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap:(){},
                          child:Container(
                            padding: EdgeInsets.only(top: 20.0),
                            color: Colors.white,
                            width:100,
                            height: ScreenUtil().setHeight(80),
                            child: Column(
                              children: [
                                Icon(Icons.shopping_cart),
                                Text('购物车'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: MyButton(
                              cb: () async{
                                if(this._productContentList[0].attr.length > 0 ){
                                  eventBus.fire( new ProductContentEvent("加入购物车"));
                                }else{
                                 await CarServices.addCart(this._productContentList[0 ]);
                                 this.cartProvider.updateCartList();
                                }
                              },
                              color: Colors.white,
                              text: "加入购物车",
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: MyButton(
                              color: Colors.white,
                              bgcolor: Colors.amberAccent,
                              text: "立即购买",
                              cb: (){
                                eventBus.fire(ProductContentEvent("立即购买"));
                              },
                            )
                        ),
                      ],
                    )
                  ),
                )
              ],
            ):LoadingWidget(),
        )
    );
  }
}
