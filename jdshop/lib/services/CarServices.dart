/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 20:06 2021-07-17
 * @Modified By:
 **/

import 'dart:convert';
import 'package:jdshop/config/config.dart';
import '../config/config.dart';
import 'Storage.dart';

class CarServices{


  static addCart(item) async {

    // 把对象准换成map类型
    item = CarServices.formatCartData(item);
    try{
      List cartListData = json.decode(await Storage.getString('cartList'));
      bool hasData = cartListData.any((value){
        if(value['_id']==item['_id']&&value['selectedAttr']==item['selectedAttr'])
          return true;
        else{
          return false;
        }
      });

      if(hasData){
        for(var i=0; i<cartListData.length;i++){
          if(cartListData[i]['_id']==item['_id']&&cartListData[i]['selectedAttr']==item['selectedAttr']){
            cartListData[i]["count"] = cartListData[i]["count"] +1;
          }
        }
      } else{
        cartListData.add(item);
        await Storage.setString('cartList', json.encode(cartListData));
      }
    }catch(e){
      List tempList=[];
      tempList.add(item);
      await Storage.setString('cartList', json.encode(tempList));
    }
  }

  // 过滤数据
  static formatCartData(item){

    //图片处理
    String sPic = item.pic;
    sPic = Config.domain + sPic.replaceAll('\\', '/');

    final Map data = new Map<String,dynamic>();
    data['_id'] = item.sId;
    data['title'] = item.title;

    //数据类型的处理
    print(item.price.runtimeType.toString());
    if(item.price is int || item.price is double){
      data['price'] = item.price;
    }else {
      data['price'] = double.parse(item.price);
    }
    data['selectedAttr'] = item.selectedAttr;
    data['count'] = item.count;
    data['pic'] = sPic;
    // 是否选中
    data['checked'] = true;
    return data;

  }
}
