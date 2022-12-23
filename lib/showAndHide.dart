// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';

class YZShowAndHideWidget extends StatefulWidget {
  const YZShowAndHideWidget({Key? key}) : super(key: key);
  @override
  _YZhowAndHideState createState() => _YZhowAndHideState();
}

class _YZhowAndHideState extends State<YZShowAndHideWidget> {
  bool show = false;

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
        title: const Text('Widget Show and Hide'),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 15.0)),
            _offstage(),
            const Padding(padding: EdgeInsets.only(top: 15.0)),
            _visibility(),
            const Padding(padding: EdgeInsets.only(top: 15.0)),
            _opacity(),
            const Padding(padding: EdgeInsets.only(top: 15.0)),
            _size(),
            const Padding(padding: EdgeInsets.only(top: 15.0)),
            TextButton.icon(
              onPressed: () {
                show = !show;
                setState(() {});
              },
              icon: const Icon(
                Icons.home,
                color: Colors.green,
              ),
              label: Text(
                show ? 'hide' : 'show',
                style: const TextStyle(color: Colors.orange),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Offstage控制组件隐藏也不保留空间位置，其对应的事件也不会响应
  /// 如果Offstage 和 Positioned 一起使用，要把 Offstage 放Positioned里面，包裹 Positioned 会出现问题 **
  Container _offstage() {
    return Container(
      width: 100.0,
      height: 100.0,
      color: Colors.cyan,
      child: Row(
        children: [
          Offstage(
            offstage: !show,
            child: Image.asset(
              'assets/images/icon_phone.png',
              // color: Colors.cyan,
            ),
          ),
          const Text('title'),
        ],
      ),
    );
  }

  /// Visibility组件隐藏并且不保留空间位置, 其对应的事件也不会响应
  Container _visibility() {
    return Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: show,
            child: Image.asset(
              'assets/images/icon_phone.png',
              // color: Colors.cyan,
            ),
          ),
          const Text('title'),
        ],
      ),
    );
  }

  /// opacity设置0时，本质上把widget的透明度设置为完全透明，看不见，
  /// 但是空间并没有消失，并且还占着对应的位置，对应的点击事件也会响应
  Container _opacity() {
    return Container(
      width: 100.0,
      height: 100.0,
      color: Colors.green,
      child: Row(
        children: [
          Opacity(
            opacity: show ? 1.0 : 0.0,
            child: Image.asset(
              'assets/images/icon_phone.png',
              // color: Colors.cyan,
            ),
          ),
          const Text('title'),
        ],
      ),
    );
  }

  /// 通过外层widget的size属性来达到控件的隐藏和显示
  Container _size() {
    return Container(
      width: 100.0,
      height: 100.0,
      color: Colors.yellow,
      child: Row(
        children: [
          SizedBox(
            width: show ? 30.0 : 0.0,
            child: Image.asset(
              'assets/images/icon_phone.png',
              // color: Colors.cyan,
            ),
          ),
          const Text('title'),
        ],
      ),
    );
  }
}
