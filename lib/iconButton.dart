// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZIconButtonWidget extends StatefulWidget {
  const YZIconButtonWidget({Key? key}) : super(key: key);

  @override
  YZIconButtonState createState() => YZIconButtonState();
}

class YZIconButtonState extends State<YZIconButtonWidget> {
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
        backgroundColor: Colors.cyan,
        title: const Text('IconButton\'s'),
      ),
      body: SafeArea(
        child: _listView(),
      ),
    );
  }

  ListView _listView() {
    return ListView(
      children: [_normalButton()],
    );
  }

  IconButton _normalButton() {
    return IconButton(
      onPressed: () {
        print('click icon button');
      },
      icon: const Icon(Icons.favorite),
      // icon 大小
      iconSize: 44.0,
      // icon 颜色
      color: Colors.orange,
      // icon 不可点击颜色，onPressed == null 时生效
      disabledColor: Colors.grey,
      // 点击时闪过的颜色
      splashColor: Colors.red,
      // 按下去高亮的颜色
      highlightColor: Colors.yellow,
      // 外边距,触发事件时扩散的区域
      padding: const EdgeInsets.all(15.0),
    );
  }
}
