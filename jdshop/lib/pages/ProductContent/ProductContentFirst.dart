/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 14:55 2021-05-05
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/widget/myButton.dart';
import '../../config/config.dart';

class ProductContentFirst extends StatefulWidget {

  final List _productContentList;
  ProductContentFirst(this._productContentList,{Key key}) : super(key: key);

  @override
  _ProductContentFirstState createState() => _ProductContentFirstState();
}

class _ProductContentFirstState extends State<ProductContentFirst> {


  var _productContent;
  var attr;
  @override
  void initState(){
    super.initState();
    this._productContent = widget._productContentList[0];
    this.attr = this._productContent.attr;
  }

  //点击弹出筛选框的方法
  _attrBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return GestureDetector(
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Wrap(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: ScreenUtil().setWidth(60),
                            padding: EdgeInsets.only(top: 22),
                            child: Text("颜色",style: TextStyle(fontWeight: FontWeight.bold),),),
                          Container(
                            child: Wrap(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Wrap(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: ScreenUtil().setWidth(60),
                            padding: EdgeInsets.only(top: 22),
                            child: Text("尺寸",style: TextStyle(fontWeight: FontWeight.bold),),),
                          Container(
                            child: Wrap(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Wrap(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: ScreenUtil().setWidth(60),
                            padding: EdgeInsets.only(top: 22),
                            child: Text("型号",style: TextStyle(fontWeight: FontWeight.bold),),),
                          Container(
                            child: Wrap(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Chip(
                                      label: Text("白色"),
                                      padding: EdgeInsets.all(10)
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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
                              cb: (){},
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
                                cb: (){
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
        });
  }

  @override
  Widget build(BuildContext context) {

    String pic = Config.domain + this._productContent.pic;
    pic = pic.replaceAll('\\', '/');
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: [
        AspectRatio(
          aspectRatio: 16 / 12,
          child: Image.network(pic,fit: BoxFit.cover,),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            this._productContent.title,
            style: TextStyle(
              color: Colors.black38,
            ),
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
                    Text(
                      '￥${this._productContent.price}',
                      style: TextStyle(color: Colors.red, fontSize: 26),
                    )
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
        Column(
          children: [
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
        )
      ],
    );
  }
}
