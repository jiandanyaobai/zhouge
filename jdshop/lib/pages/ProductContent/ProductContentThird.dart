/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 14:55 2021-05-05
 * @Modified By:
 **/

import 'package:flutter/material.dart';


class ProductContentThird extends StatefulWidget {

  final List _productContentList;
  ProductContentThird(this._productContentList,{Key key}):super(key : key);
  @override
  _ProductContentThirdState createState() => _ProductContentThirdState();
}

class _ProductContentThirdState extends State<ProductContentThird> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('商品评价'),
    );
  }
}

