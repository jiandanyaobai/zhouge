/**
 * @Author: zhouge
 * @Description: 条码主界面
 * @Date: Created in 17:19 2020-10-11
 * @Modified By:
 **/
import 'package:flutter/material.dart';
import 'Pages/Workpage.dart' show WorkPages;
import 'Pages/Salespage.dart' show SalesPages;
import 'Pages/WareHousePage.dart' show WareHousePages;
import 'Pages/Purchasepage.dart' show PurchasePages;
import 'config/conf.dart' show GlobalVariable;
import 'Pages/Settingpage.dart' show SettingPages;

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: true,
              actions: <Widget>[
                GestureDetector(
                  onTap: (){  Navigator.of(context).push(MaterialPageRoute( builder: (context)=> SettingPages() ));  },
                  child:Image.asset('assets/images/temp_setting.png', width: 26.0, height: 26.0,),
                ),
                SizedBox(width: 5.0,)
              ],
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(text: GlobalVariable.AppHomeTitle, style: TextStyle(fontSize: 20.0)),
                  TextSpan(text: GlobalVariable.AppHomeSubTitle, style: TextStyle(fontSize: 12.0))
                ]),
              ),

              //可以单独设置，固定高度为40H
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: Material(
                  color: Colors.white,
                  child: TabBar(
                      labelPadding: EdgeInsets.all(10.0),
                      labelStyle: TextStyle(fontSize: 16.0),
                      unselectedLabelColor: Colors.black54,
                      labelColor: Colors.blue,
                    tabs: <Widget>[
                        Text('采购管理'),
                        Text('生产管理'),
                        Text('仓库管理'),
                        Text('销售管理'),
                    ],
                  ),
                )
              )),
          body: Container(
            color: Colors.white,
            child: TabBarView(
              children: <Widget>[
                PurchasePages(),
                WorkPages(),
                WareHousePages(),
                SalesPages(),
              ],
            ),
          )
        ));
  }
}
