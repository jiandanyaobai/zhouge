/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 22:13 2021-01-16
 * @Modified By:
 **/
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:jdshop/model/FocusModel.dart';
import 'package:jdshop/config/config.dart';
import 'package:jdshop/model/ProductModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    this._getFocusData();
    this._getrecommandProductList();
  }

  List _focusList = [];
  List _recommandProductList = [];
  List _recList = [];

  //获取推荐商品
  _getrecommandProductList() async {
    var url = 'http://jdmall.itying.com/api/plist';
    var result = await Dio().get(url);
    var recommandProduct = ProductModel.fromJson(result.data);
    setState(() {
      this._recommandProductList = recommandProduct.result; //result 为数组的返回值
    });
  }

  //获取热门商品
  _getFocusData() async {
    var url = '${Config.domain}api/focus/';
    var result = await Dio().get(url);
    var focusData = FocusModel.fromJson(result.data);

    setState(() {
      this._focusList = focusData.result;
    });
  }

  //获取轮播图
  Widget _swiperWidget() {
    if (this._focusList != null) {
      return Container(
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              String str = this._focusList[index].pic;
              return Image.network(
                "${Config.domain}${str.replaceAll('\\', '/')}",
                fit: BoxFit.fill,
              );
            },
            autoplay: true,
            itemCount: this._focusList.length,
            pagination: SwiperPagination(),
          ),
        ),
      );
    } else {
      return Text('加载中');
    }
  }

  ///标题
  Widget _titleWidget(value) {
    return Container(
      height: ScreenUtil().setHeight(24),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  width: ScreenUtil().setWidth(10), color: Colors.red))),
      child: Text(
        value,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  /// 热门商品
  Widget _hotProductList() {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 120.0,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 10.0),
                  width: 80.0,
                  height: 80.0,
                  child: Image.network(
                    "https://www.itying.com/images/flutter/hot${index + 1}.jpg",
                    fit: BoxFit.fitWidth,
                  )),
              Text("第${index}条"),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }

  //打印数据
//  _genData(){
//    print(this._recommandProductList);
//  }
  ///推荐商品
  Widget _recProductList() {
    ///单个容器的长度
    var itemWidth = (ScreenUtil().screenWidth - 30) / 2;

    ///定义返回的数据
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: this._recommandProductList.map((value) {
          String pic = Config.domain + value.pic;
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/productContent',
                  arguments: {'id': value.sId});
            },
            child: Container(
              width: itemWidth,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1.0)),
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Image.network(
                      "${pic.replaceAll('\\', '/')}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "${value.title}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon:
                Icon(Icons.center_focus_weak, size: 28, color: Colors.black87),
            onPressed: null,
          ),
          title: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/search');
            },
            child: Container(
              height: ScreenUtil().setHeight(36),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(233, 233, 233, 0.8),
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.search),
                  Text(
                    '笔记本',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.message, size: 28, color: Colors.black87),
              onPressed: null,
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            _swiperWidget(),
            SizedBox(
              height: 10.0,
            ),
            _titleWidget('猜你喜欢'),
            _hotProductList(),
            SizedBox(
              height: 10.0,
            ),
            _titleWidget('热门推荐'),
            _recProductList(),
          ],
        ),
      ),
    );
  }
}
