
/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 14:09 2021-07-03
 * @Modified By:
 **/

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:jdshop/services/Storage.dart';


class Cart with ChangeNotifier{

  List _cartList=[];  //状态
  bool _isCheckedAll=false; // 全选状态按钮

  List get cartList=>this._cartList;
  int get cartNum=>this._cartList.length;

  //总价
  double _allPrice = 0;
  double get allProce => this._allPrice;

  // 直接获取，全局变量、全选状态的按钮
  bool get isCheckedAll=>this._isCheckedAll;

  //初始化数据状态
  Cart(){
    this.init();
  }

  // 初始化状态，获取购物车的数据
  init() async {
    try {
      List cartListData = json.decode(await Storage.getString('cartList'));
      this._cartList=cartListData;
    }catch(e){
      this._cartList=[];
    }
    this._isCheckedAll = this.isCheckAll();
    this.computeAllPrice();
    notifyListeners();
  }

  //更新方法
  updateCartList(){
    this.init();
  }

  //改变item的数据,购物车上的加减按钮
  changeItemCount(){
    Storage.setString("cartList",json.encode(this._cartList));
    this.computeAllPrice();
    notifyListeners();
  }

  //全选和反选的方法
  checkAll(value){
    for (var i =0; i<_cartList.length; i++){
      this._cartList[i]["checked"] = value;
    }
    this._isCheckedAll=value;
    Storage.setString("cartList",json.encode(this._cartList));
    this.computeAllPrice();
    notifyListeners();
  }

  //判断是否全选
  bool isCheckAll(){
    if(this._cartList.length > 0) {
      for (var i = 0; i < this._cartList.length; i++) {
        if (this._cartList[i]["checked"] == false) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  //监听每一项目的选中时间
  itemChange(){
    if(this.isCheckAll()==true){
      this._isCheckedAll=true;
    }else{
      this._isCheckedAll=false;
    }
    //重新通知
    this.computeAllPrice();
    Storage.setString("cartList",json.encode(this._cartList));
    notifyListeners();
  }

  //计算总价
  computeAllPrice(){
    double tempAllPrice = 0;
    for (var i = 0; i < this._cartList.length; i++) {
      if (this._cartList[i]["checked"] == true) {
        tempAllPrice+=this._cartList[i]["price"]*this._cartList[i]["count"];
      }
    }
    this._allPrice = tempAllPrice;
    notifyListeners();
  }

  //删除数据
  // 数据删除要注意、不可以有很多数据
  removeItem(){
    List tempList = [];
    for (var i = 0; i < this._cartList.length; i++) {
      if (this._cartList[i]["checked"] == false) {
        tempList.add(this._cartList[i]);
      }
    }
    this._cartList = tempList;
    Storage.setString("cartList",json.encode(this._cartList));
    this.computeAllPrice();
    notifyListeners();
  }
  

}