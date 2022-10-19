import 'package:flutter/material.dart';

/// 卡片组件，提供了圆角和阴影，实际用途其实和 Container 差不多
class YZCardWidget extends StatelessWidget {
  const YZCardWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Card",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [_normalCard(), _shapeCard()],
      ),
    );
  }

  Card _normalCard() {
    return Card(
      // 背景色
      color: Colors.red,
      // 阴影颜色
      shadowColor: Colors.yellow,
      // 阴影高度
      elevation: 20.0,
      // 是否在 child 前绘制 border，默认为 true
      borderOnForeground: false,
      // 外边距
      margin: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 30.0),
      child: Container(
        width: 100.0,
        height: 100.0,
        alignment: Alignment.center,
        child: const Text('Normal Card'),
      ),
    );
  }

  Card _shapeCard() {
    return Card(
      // 背景色
      color: Colors.red,
      // 阴影颜色
      shadowColor: Colors.yellow,
      // 阴影高度
      elevation: 20.0,
      // 是否在 child 前绘制 border，默认为 true
      borderOnForeground: false,
      // 外边距
      margin: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 30.0),
      // 边框
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: const BorderSide(width: 3.0, color: Colors.yellow),
      ),
      child: Container(
        width: 100.0,
        height: 88.0,
        alignment: Alignment.center,
        child: const Text('Normal Card'),
      ),
    );
  }
}
