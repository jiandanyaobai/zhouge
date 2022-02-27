/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 14:55 2021-05-05
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/model/ProductContentModel.dart';
import 'package:jdshop/services/CarServices.dart';
import 'package:jdshop/widget/myButton.dart';
import '../../config/config.dart';
//广播
import '../../services/EventBus.dart';
import 'package:provider/provider.dart';
import '../../provider/Cart.dart';
import '../../pages/ProductContent/CartNum.dart';

class ProductContentFirst extends StatefulWidget {
  final List _productContentList;
  ProductContentFirst(this._productContentList, {Key key}) : super(key: key);

  @override
  _ProductContentFirstState createState() => _ProductContentFirstState();
}

class _ProductContentFirstState extends State<ProductContentFirst> {

  ProductContentItem _productContent;
  List _attr = [];

  String _selectedValue;

  //广播监听
  var actionEventBus;

  var cartProvider;

  @override
  void initState() {
    super.initState();

    this._productContent = widget._productContentList[0];
    this._attr = this._productContent.attr;
    this.initAttr();
    this.actionEventBus = eventBus.on<ProductContentEvent>().listen((str) {
      this._attrBottomSheet();
    });
}

  // 销毁
  void dispose(){
    super.dispose();
//    this.actionEventBus.cancel();
    this.actionEventBus.cancel();

  }

  // 初始化Attr 格式化数据
  initAttr(){
    var attr = this._attr;
    for( var i = 0; i< attr.length; i++ ){
      for( var j=0; j< attr[i].list.length; j++){
        if( j==0){
          print(attr[i].list[j]);
          attr[i].attrList.add({"title": attr[i].list[j],"checked": true} );
        }else{
          attr[i].attrList.add({"title": attr[i].list[j],"checked": false} );
        }
      }
    }
   }

  // 封装组件 attr
  List<Widget> _getAttrItemWidget(attrItem,setBomttomState) {
    List<Widget> atterItemList = [];
    attrItem.attrList.forEach((item) {
      atterItemList.add(Container(
          margin: EdgeInsets.all(10),
          child: InkWell(
            child: Chip(
              label: Text("${item["title"]}" ?? Config.nullmessage),
              padding: EdgeInsets.all(10),
              backgroundColor: item["checked"] ? Colors.red:Colors.black26
            ),
            onTap: (){
              _changeAttr(attrItem.cate,item["title"],setBomttomState);
            },
          )
      )
      );
    }
    );

    return atterItemList;
  }

  // 改变属性值
  _changeAttr(cate, title,setBottomState){
    var attr = this._attr;
    for (var i = 0; i < attr.length; i++){
      if(attr[i].cate == cate){
        for (var j=0; j<attr[i].attrList.length; j++){
          attr[i].attrList[j]["checked"] = false;
          if(title==attr[i].attrList[j]["title"]){
            attr[i].attrList[j]["checked"]=true;
          }
        }

      }
    }
    //数据刷新，改变数据
    setBottomState(() {  //改变的showModelBottomSheet 的数据，来源于statefulbuilder
      this._attr = attr;
    });
    _getSelectedAttrValue();
  }

  //获取选中的值
  _getSelectedAttrValue() {
    var _list = this._attr;
    List tempArr = [];
    for (var i = 0; i < _list.length; i++) {
      for (var j = 0; j < _list[i].attrList.length; j++) {
        if (_list[i].attrList[j]['checked'] == true) {
          tempArr.add(_list[i].attrList[j]["title"]);
        }
      }
    }
    setState(() {
      this._selectedValue = tempArr.join(',');
      //给筛选属性赋值
      this._productContent.selectedAttr=this._selectedValue;
    });

  }

  //封装一个组件、渲染attr
  List<Widget> _getAttrWidget(setBottomState) {
    List<Widget> attrList = [];
    this._attr.forEach((attrItem) {
      attrList.add(Wrap(
        children: [
          Container(
            width: ScreenUtil().setWidth(56),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(24),
              ),
              child: Text("${attrItem.cate}:" ?? Config.nullmessage, style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(280),
            child: Wrap(
              children: _getAttrItemWidget(attrItem,setBottomState),
            ),
          )
        ],
      ));
    });

    return attrList;
  }

  //点击弹出筛选框的方法
  _attrBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, setBomttomState){
            return GestureDetector(
              onTap: (){
                return false;
              },
                child: Stack(
                  children: [
                    ListView(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _getAttrWidget(setBomttomState),
                        ),
                        Divider(),
                        Container(
                          width: ScreenUtil().setWidth(56),
                          alignment: Alignment.centerLeft,
                          child:  InkWell(
                            onTap: (){
                              _attrBottomSheet();
                            },
                            child: Row(
                              children: [
                                SizedBox(width: 14,),
                                Text("数量: ",style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(width: 10,),
                                CartNum(this._productContent)
                              ],
                            ),
                          )
                          ,
                        )
                      ],
                    ),
                    Positioned(
                        bottom: 0,
                        width: ScreenUtil().setWidth(360),
                        height: ScreenUtil().setHeight(76),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: MyButton(
                                cb:() async {
                                  await CarServices.addCart(this._productContent);
                                  //关闭底部的筛选属性
                                  Navigator.of(context).pop();
                                  //调用provider 更新数据
                                  this.cartProvider.updateCartList();

                                },
                                color: Colors.white,
                                text: "加入购物车",
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: MyButton(
                                  color: Colors.white,
                                  bgcolor: Colors.amberAccent,
                                  text: "立即购买",
                                  cb: () {
                                    print('123');
                                  },
                                )
                            ),
                          ],
                        )
                    )
                  ],
                )
            );
          }
          );
        }
        );
  }

  @override
  Widget build(BuildContext context) {
    String pic = Config.domain + this._productContent.pic;
    pic = pic.replaceAll('\\', '/');

    //provider 获取数据
    this.cartProvider = Provider.of<Cart>(context);

    return ListView(
      padding: EdgeInsets.all(10.0),
      children: [
        AspectRatio(
          aspectRatio: 16 / 12,
          child: Image.network("${pic}", fit: BoxFit.cover,),
        ),

        //标题
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text("${this._productContent.title}", style: TextStyle(color: Colors.black38,),),
        ),

        //子标题
        Container(
          padding: EdgeInsets.only(top:10),
          child: Text(this._productContent.subTitle ?? "没有写下任何描述信息",
          style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ),

        // 价格
        Container(
          padding: EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text('特价'),
                    Text('￥${this._productContent.price}', style: TextStyle(color: Colors.red, fontSize: 26),)
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('原价'),
                    Text(
                      '￥5${this._productContent.oldPrice}',
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 20.0,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        //筛选
            Container(
              height: ScreenUtil().setHeight(40),
              child: InkWell(
                onTap: () {
                  _attrBottomSheet();
                },
                child: Row(
                  children: [
                    Text(
                      '已选：',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(' 230,'),
                    Text(' XL,'),
                    Text(' 黑色，'),
                    Text(' 1件'),
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              height: ScreenUtil().setHeight(20),
              child: Row(
                children: [
                  Text(
                    '运费：',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('免运费')
                ],
              ),
            ),
            Divider(),
          ],
        );
  }
}
