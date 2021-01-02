/**
 * @Author: zhouge
 * @Description: 仓库界面
 * @Date: Created in 15:26 2020-10-18
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import '../models/models.dart' show  WareHouseData;

class WareHousePages extends StatelessWidget {
  final _warehousedata = WareHouseData.mock().demos;
  final int _itemLength = WareHouseData.mock().demos.length;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2/1.5),
        itemCount: _itemLength,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            radius: 0.0,
            highlightColor:Colors.transparent,
            onTap: _warehousedata[index].onPressed,
            child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Column(
                children: <Widget>[
                  Image.asset(_warehousedata[index].avater,width: 45.0,height: 45.0,),
                  SizedBox(height: 5.0,),
                  Text(_warehousedata[index].title)
                ],
              ),
            ),
          );
        });
  }
}
