/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 22:03 2021-01-16
 * @Modified By:
 **/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart.dart';
import 'category.dart';
import 'user.dart';
import 'home.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  var _pageController;

  void initState() {
    super.initState();
    _pageController = PageController(initialPage: this._currentIndex);
  }

  List<Widget> _pagelist = [HomePage(), CateGory(), CartPage(), UserPage()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.center_focus_weak,size:28,color:Colors.black87),
            onPressed: null,
          ),
          title: InkWell(
            onTap: (){
              Navigator.pushNamed(context, '/search');
            },
            child: Container(
              height: ScreenUtil().setHeight(36),
              decoration: BoxDecoration(
                color:Color.fromRGBO(233,233,233,0.8),
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.only(left:10),
              child: Row(
                children: [
                  Icon(Icons.search),
                  Text('笔记本',style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.message,size:28, color: Colors.black87),
              onPressed: null,
            )
          ],
        ),
        body: PageView(
          onPageChanged: (index){
            setState(() {
              this._currentIndex = index;
              print("当前移动的界面为${index}");
            });
          },
          controller: this._pageController,
          children: this._pagelist,
        ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: this._currentIndex,
        onTap: (index){
          setState(() {
            this._currentIndex = index;
            this._pageController.jumpToPage(this._currentIndex);
          });
        },
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 26.0,), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.category,size:26.0), title: Text('分类')),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,size:26.0), title: Text('购物车')),
          BottomNavigationBarItem(icon: Icon(Icons.people,size:26.0), title: Text('我的')),
        ],
      ),
    );
  }
}
