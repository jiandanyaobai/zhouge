/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 14:55 2021-05-05
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../config/config.dart';

class ProductContentSecond extends StatefulWidget {
  final List __productContentList;
  ProductContentSecond(this.__productContentList, {Key key}) : super(key: key);
  @override
  _ProductContentSecondState createState() => _ProductContentSecondState();
}

class _ProductContentSecondState extends State<ProductContentSecond> {
  var _id;
  String host_url = Config.domain;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._id = widget.__productContentList[0].sId;
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      // initialUrl: 'http://jdmail.itying.com/pcontent?id=${this._id}',
      initialUrl: '${host_url}pcontent?id=${this._id}',
    );
  }
}
