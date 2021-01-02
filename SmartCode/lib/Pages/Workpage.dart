/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 22:24 2020-10-13
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import '../models/models.dart' show WorkData;


class WorkPages extends StatelessWidget {

  final _workhomedata = WorkData.mock().demos;
  final int _itemLength =  WorkData.mock().demos.length;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _itemLength,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2/1.5
        ),
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            radius: 0.0,
            onTap: _workhomedata[index].onPressed,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Image.asset(_workhomedata[index].avater,width: 45.0,height: 45.0,),
                  SizedBox(height: 5.0,),
                  Text(_workhomedata[index].title),
                ],
              ),
            ),
          );
        }  );
  }
}

