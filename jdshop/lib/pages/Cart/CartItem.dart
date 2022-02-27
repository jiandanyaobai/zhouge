
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CartNum.dart';
import 'package:provider/provider.dart';
import '../../provider/Cart.dart';

class CartItem extends StatefulWidget {

  Map _itemData;
  CartItem(this._itemData, {Key key}):super(key:key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  var cartProvider;
  Map _itemData;

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
      height: ScreenUtil().setHeight(100),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.black12,
          )
        )
      ),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(40),
            child: Checkbox(
              value:_itemData["checked"],
              onChanged:(val){
                setState(() {
                  _itemData["checked"] = !_itemData["checked"];
                  cartProvider.itemChange();
                });
              },
              activeColor: Colors.pink,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(80),
            child: Image.network("${_itemData["pic"]}",fit: BoxFit.cover,),
          ),
          Expanded(
            flex: 1,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${_itemData["title"]}",maxLines: 2,),
                    Text("${_itemData["selectedAttr"]}",maxLines: 1,),
                    //SizedBox(height: 40),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("￥${_itemData["price"]}",style: TextStyle(color: Colors.red),),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CartNum(_itemData)
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
