/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 14:55 2021-05-05
 * @Modified By:
 **/

import 'package:flutter/material.dart';


class ProductContentSecond extends StatefulWidget {

  final List __productContentList;
  ProductContentSecond(this.__productContentList, {Key key}):super(key : key);
  @override
  _ProductContentSecondState createState() => _ProductContentSecondState();
}

class _ProductContentSecondState extends State<ProductContentSecond> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('商品页面'),
    );
  }
}

