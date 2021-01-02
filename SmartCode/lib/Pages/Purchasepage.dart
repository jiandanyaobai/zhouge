/**
 * @Author: zhouge
 * @Description: 采购界面主页
 * @Date: Created in 16:04 2020-10-18
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import '../models/models.dart' show PurchaseData;


class PurchasePages extends StatelessWidget {
  final _purchasedata = PurchaseData.mock().demos;
  final int _itemLength = PurchaseData.mock().demos.length;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _itemLength,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2/1.5),
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            radius: 0.0,
            highlightColor:Colors.transparent,
            onTap: _purchasedata[index].onPressed,
            child: Padding(
              padding: EdgeInsets.only(top:20),
              child: Column(
                children: <Widget>[
                  Image.asset(_purchasedata[index].avater,width: 45.0,height: 45.0,),
                  SizedBox(height: 5.0,),
                  Text(_purchasedata[index].title),
                ],
              ),
            ),
          );
        });
  }
}
