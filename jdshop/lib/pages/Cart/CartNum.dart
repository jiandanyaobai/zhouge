
/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 17:07 2021-07-03
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import '../../provider/Cart.dart';
import 'package:provider/provider.dart';

class CartNum extends StatefulWidget {
  var _itemData;

  CartNum(this._itemData,{Key key}):super(key: key);

  @override
  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  var _itemData;
  var cartProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._itemData = widget._itemData;
  }
  @override
  Widget build(BuildContext context) {
    this.cartProvider = Provider.of<Cart>(context);
    return Container(
      width:ScreenUtil().setWidth(92),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.black12)
      ),
      child: Row(
        children: [
          _leftBtn(),
          _centerArea(),
          _rightBtn(),
        ],
      ),
    );
  }

  //左侧按钮
  Widget _leftBtn(){
    return InkWell(
      onTap: (){
        if(this._itemData["count"] >1 ) {
          setState(() {
            this._itemData["count"]--;
          });
        this.cartProvider.changeItemCount();
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(30),
        height: ScreenUtil().setHeight(30),
        child: Text("-"),
      ),
    );
  }

  //右侧按钮
  Widget _rightBtn(){
    return InkWell(
      onTap: () {
        this._itemData["count"]++;
        this.cartProvider.changeItemCount();
      },
        child: Container(
          alignment: Alignment.center,
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setHeight(30),
          child: Text("+"),
        )
    );
  }

  //中间数据
  Widget _centerArea(){
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 1,color: Colors.black12),
          right: BorderSide(width: 1, color:Colors.black12)
        )
      ),
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(30),
      height: ScreenUtil().setHeight(30),
      child: Text("${_itemData["count"]}"),
    );
  }


}
