
/**
 * @Author: zhouge
 * @Description:  数据持久封装
 * @Date: Created in 16:43 2021-04-18
 * @Modified By:
 **/

import 'dart:convert';
import '../services/Storage.dart';

class SearchServices{

  //新增本地缓存的数据
  static setSearchData(keywords) async {
    /*
      1、获取本地存储里面的数据
      2、判断按本地存储是否有数据
        2-1、如果有数据
          1、读取本地存储的数据
          2、判断本地存储中有没有当前数据
            如果有数据不做操作、如果没有当前数据，本地存储的数和当前数据拼接后重新写入。
        2-2、如果没有数据
          直接把当前数据放在数组中写入到本地存储。
      */

    try{
      var searchListData = json.decode(await Storage.getString('searchList'));

      var hasData = searchListData.any((v){
        return v == keywords;
      });
      if(!hasData){
        searchListData.add(keywords);
        await Storage.setString('searchList', json.encode(searchListData));
      }

    }catch(e){
      List tempList = [];
      tempList.add(keywords);
      await Storage.setString('searchList', json.encode(tempList));
    }

  }

  //获取本地缓存的列表数据
  static getSearchList() async {
    try{
      List searchListData = json.decode(await Storage.getString('searchList'));
      return searchListData;
    } catch (e) {
      return [];
    }
  }


  //清空本地缓存数据
  static clearHistoryList() async{
    await Storage.remove('searchList');
  }

  //删除本地存储的数据
  static removeHistoryList(keywords) async{
    List historyListData = json.decode(await Storage.getString('searchList'));
    historyListData.remove(keywords);
    await Storage.setString('searchList', json.encode(historyListData));
  }

}