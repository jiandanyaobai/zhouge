import 'package:flutter/cupertino.dart';
/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 21:03 2020-10-16
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import '../models/models.dart' show SaleData;

class SalesPages extends StatelessWidget {

  final _saledata = SaleData.mock().demos;
  final int _itemLength =  SaleData.mock().demos.length;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio:2/1.5 ),
        itemCount: _itemLength,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              radius: 0.0,
              highlightColor:Colors.transparent,
              onTap: _saledata[index].onPressed,
              child: Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: <Widget>[
                    Image.asset(_saledata[index].avater,width: 45.0,height: 45.0,),
                    SizedBox(height: 5.0,),
                    Text(_saledata[index].title)
                  ],
                ),
              ));
        });
  }
}
