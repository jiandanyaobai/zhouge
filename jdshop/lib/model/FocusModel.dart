/**
 * @Author: zhouge
 * @Description:  focusModel的数据
 * @Date: Created in 7:51 2021-01-17
 * @Modified By:
 **/

class FocusModel {

  List<FocusItemModel> result;

  //构造函数
  FocusModel({this.result});

  //获取json字符串循环编译到result中，这里还需要进行循环。
  FocusModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<FocusItemModel>();
      json['result'].forEach((v) {
        result.add(new FocusItemModel.fromJson(v));
      });
    }
  }

  //暂时没有用到
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

///子元素的转换
class FocusItemModel {
  String sId;
  String title;
  String status;
  String pic;
  String url;

  ///构造函数
  FocusItemModel({this.sId, this.title, this.status, this.pic, this.url});

  /// 数据转换，这里就直接赋值了
  FocusItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['status'] = this.status;
    data['pic'] = this.pic;
    data['url'] = this.url;
    return data;
  }
}
