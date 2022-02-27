import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/provider/Counter.dart';
import 'package:provider/provider.dart';
import '../Cart/CartItem.dart';
import '../../provider/Cart.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //编辑开关
  bool _isEdit = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("购物车"),
          actions: [
            IconButton(
                icon: Icon(Icons.launch),
                onPressed: () {
                  setState(() {
                    this._isEdit = !this._isEdit;
                  });
                })
          ],
        ),
        body: cartProvider.cartList.length > 0
            ? Stack(
                children: [
                  ListView(
                    children: [
                      Column(
                        children: cartProvider.cartList.map((value) {
                          return CartItem(value);
                        }).toList(),
                      )
                    ],
                  ),
                  Positioned(
                      width: ScreenUtil().setWidth(360),
                      bottom: 0,
                      height: ScreenUtil().setHeight(50),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 1, color: Colors.black12)),
                          color: Colors.white,
                        ),
                        child: Align(
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Container(
                                      width: ScreenUtil().setWidth(40),
                                      child: Checkbox(
                                          value: cartProvider.isCheckedAll,
                                          activeColor: Colors.pink,
                                          onChanged: (val) {
                                            //实现全选按钮
                                            cartProvider.checkAll(val);
                                          }),
                                    ),
                                    Text("全选"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    this._isEdit == false
                                        ? Text("合计：")
                                        : Text(""),
                                    this._isEdit == false
                                        ? Text(
                                            "${cartProvider.allProce}",
                                            style: TextStyle(color: Colors.red),
                                          )
                                        : Text('')
                                  ],
                                ),
                              ),
                              this._isEdit == false
                                  ? Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      alignment: Alignment.centerRight,
                                      child: RaisedButton(
                                        onPressed: () {},
                                        color: Colors.red,
                                        child: Text(
                                          "结算",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ))
                                  : Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      alignment: Alignment.centerRight,
                                      child: RaisedButton(
                                        onPressed: () {
                                          cartProvider.removeItem();
                                        },
                                        color: Colors.red,
                                        child: Text(
                                          "删除",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                            ],
                          ),
                        ),
                      ))
                ],
              )
            : Center(
                child: Text("购物车空空.."),
              ));
  }
}
