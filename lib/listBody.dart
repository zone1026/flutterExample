// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 一个widget，它沿着一个给定的轴，顺序排列它的子元素
class YZListBodyWidget extends StatelessWidget {
  const YZListBodyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListBody',
        ),
      ),
      body: SingleChildScrollView(
        child: _listBody(),
      ),
    );
  }
}

/// mainAxis = Axis.vertical：滑动方向
/// reverse = false：是否倒序
/// children = const <Widget>[]：
ListBody _listBody() {
  return ListBody(
    mainAxis: Axis.vertical,
    reverse: false,
    children: _children(),
  );
}

List<Widget> _children() {
  return [
    Container(
      height: 100.0,
      color: Colors.blue[50],
    ),
    Container(
      height: 100.0,
      color: Colors.blue[100],
    ),
    Container(
      height: 100.0,
      color: Colors.blue[200],
    ),
    Container(
      height: 100.0,
      color: Colors.blue[300],
    ),
    Container(
      height: 100.0,
      color: Colors.blue[400],
    ),
    Container(
      height: 100.0,
      color: Colors.blue[500],
    ),
    Container(
      height: 100.0,
      color: Colors.blue[600],
    ),
    Container(
      height: 100.0,
      color: Colors.blue[700],
    ),
  ];
}
