/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 22:03 2021-01-16
 * @Modified By:
 **/

import 'package:flutter/material.dart';
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
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              this._currentIndex = index;
              print("当前移动的界面为${index}");
            });
          },
          controller: this._pageController,
          children: this._pagelist,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this._currentIndex,
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
              this._pageController.jumpToPage(this._currentIndex);
            });
          },
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 26.0,
                ),
                title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.category, size: 26.0), title: Text('分类')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, size: 26.0), title: Text('购物车')),
            BottomNavigationBarItem(
                icon: Icon(Icons.people, size: 26.0), title: Text('我的')),
          ],
        ),
    );
  }
}
