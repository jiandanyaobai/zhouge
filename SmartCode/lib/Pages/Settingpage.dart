/**
 * @Author: zhouge
 * @Description: 设置页面展示
 * @Date: Created in 16:26 2020-10-25
 * @Modified By:
 **/
import 'package:flutter/material.dart';
import '../config/conf.dart';
import '../models/SystemSetting.dart' show FullIconButton, SettingData;

class SettingPages extends StatefulWidget {
  @override
  _SettingPagesState createState() => _SettingPagesState();
}

class _SettingPagesState extends State<SettingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          GlobalVariable.AppSettingTitile,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          FullIconButton(
              avatar: 'assets/home/temp_paging.png',
              title: '分页设置',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
          FullIconButton(
              avatar: 'assets/home/temp_speechinput.png',
              title: '语音输入',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
          FullIconButton(
              avatar: 'assets/home/temp_mic.png',
              title: '发音选择',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
          FullIconButton(
              avatar: 'assets/home/fifo.png',
              title: 'FIFO显示',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
          FullIconButton(
              avatar: 'assets/home/temp_vibrate.png',
              title: '震动提醒',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
          FullIconButton(
              avatar: 'assets/home/bluetooth.png',
              title: '蓝牙',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
          FullIconButton(
              avatar: 'assets/home/device_unbind.png',
              title: '设备数',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
          FullIconButton(
              avatar: 'assets/home/tempsetip.png',
              title: '打印机IP',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
          FullIconButton(
              avatar: 'assets/home/tempsetip.png',
              title: '报表打印',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
          FullIconButton(
              avatar: 'assets/home/modify_pwd.png',
              title: '修改密码',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
          FullIconButton(
              avatar: 'assets/home/temp_versions.png',
              title: '版本信息',
              devicesinfo: '',
              onPressed: () {
                print('点击的是分页设置');
              }),
        ],
      ),
    );
  }
}
