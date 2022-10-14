// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZSwitchWidget extends StatefulWidget {
  const YZSwitchWidget({Key? key}) : super(key: key);
  @override
  YZSwitchWidgetState createState() => YZSwitchWidgetState();
}

class YZSwitchWidgetState extends State<YZSwitchWidget> {
  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: const Text("Switch"),
      ),
      body: SafeArea(
        child: Center(
          child: _switch(),
        ),
      ),
    );
  }

  bool switchValue = false;

  Switch _switch() {
    return Switch(
      // 关闭状态下滑块颜色
      inactiveThumbColor: Colors.blue,
      // 关闭状态下轨道颜色
      inactiveTrackColor: Colors.black,
      // 打开状态下滑块颜色
      activeColor: Colors.red,
      // 打开状态下轨道颜色
      activeTrackColor: Colors.green,
      // 打开状态下滑块图片
      // activeThumbImage: const AssetImage('assets/images/icon_phone.png'),
      activeThumbImage: const NetworkImage("https://activeThumbImage"),
      // 关闭状态下滑块图片
      // inactiveThumbImage: const AssetImage('assets/images/icon_pdf.png'),
      inactiveThumbImage: const NetworkImage("https://inactiveThumbImage"),
      // 打开状态下滑块图片加载失败回调; 加载网络图片时有用
      onActiveThumbImageError: (exception, stackTrace) {
        print("onActiveThumbImageError = $exception");
      },
      // 关闭状态下滑块图片加载失败回调; 加载网络图片时有用
      onInactiveThumbImageError: (exception, stackTrace) {
        print("onInactiveThumbImageError = $exception");
      },
      // value = true 时为打开状态，false 关闭
      value: switchValue,
      // 点击事件
      onChanged: (value) {
        switchValue = !switchValue;
        setState(() {});
      },
    );
  }
}
