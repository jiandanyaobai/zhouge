/**
 * @Author: zhouge
 * @Description: 快速收货界面
 * @Date: Created in 13:22 2021-01-03
 * @Modified By:
 **/
import 'package:flutter/material.dart';
import 'package:SmartCode/stand_ui/stand_button/common_button.dart';
import 'package:SmartCode/config/conf.dart';
import 'package:SmartCode/stand_ui/stand_input/common_input.dart';

class quickPurchase extends StatelessWidget {
  Map args;
  quickPurchase({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${args["title"]}'),
      ),
      body: InputQueryData(),
    );
  }
}

class InputQueryData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixText: '   ',
                  contentPadding: const EdgeInsets.all(1.0),
                  labelText: '供应商',
                  hintText: '请输入供应商编号',
                  border: UnderlineInputBorder(),
                  focusColor: Colors.red,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0),
            child: Container(
              height: 36.0,
              child: TextField(
                decoration: InputDecoration(
                    hintText: '请输入采购单号',
                    contentPadding: const EdgeInsets.all(1.0),
                    prefixText: '采购单号：    ',
                    hintStyle: TextStyle(fontSize: 10.0),
                    labelStyle: TextStyle(fontSize: 10.0),
                   // border: UnderlineInputBorder(),
                    focusColor: Colors.red,)
                //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)))


              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0),
            child: Container(
              height: 36.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '请输入采购单号',
                  contentPadding: const EdgeInsets.all(1.0),
                  prefixText: '采购单号：    ',
                  hintStyle: TextStyle(fontSize: 10.0),
                  labelStyle: TextStyle(fontSize: 10.0),
                  border: UnderlineInputBorder(),),
              ),
            )
          ),
          Stand_Input(
            preText: Text('送货单  '),
            width: 400.0,
            height: 50.0,
          ),
          SizedBox(height: 10.0,),
          StandButton(
            type: ButtonType.info,
            size: ButtonSize.small,
            width: Constants.StandButtonTextSize,
            borderRadius: BorderRadius.circular(20.0),
            text: Text(
              '查询',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
