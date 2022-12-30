// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 可以在水平或垂直方向多行显示其子widget（换行布局
class YZWrapWidget extends StatelessWidget {
  const YZWrapWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wrap',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: _wrap(),
      ),
    );
  }
}

/// direction = Axis.horizontal：主轴方向，决定了子组件纵向布局还是横向
/// alignment = WrapAlignment.start：主轴对齐方式，哪个方向是主轴有direction来确定
/// spacing = 0.0：每个子组件之间的间距
/// runAlignment = WrapAlignment.start：次轴对齐方式
/// runSpacing = 0.0：每行/列的间距，由direction决定，horizontal行间距，vertical列间距
/// crossAxisAlignment = WrapCrossAlignment.start：次轴对齐方式
/// textDirection：文本方向
/// verticalDirection = VerticalDirection.down：升序布局还是降序布局
/// clipBehavior = Clip.hardEdge：
/// children = const <Widget>[]：
Wrap _wrap() {
  return Wrap(
    direction: Axis.horizontal,
    alignment: WrapAlignment.start,
    spacing: 8.0,
    crossAxisAlignment: WrapCrossAlignment.start,
    runAlignment: WrapAlignment.center,
    runSpacing: 8.0,
    verticalDirection: VerticalDirection.down,
    children: _wrapChildren(),
  );
}

List<Widget> _wrapChildren() {
  return [
    const Text(
      '11111111111111111111',
      style: TextStyle(backgroundColor: Colors.red),
    ),
    const Text(
      '2222222',
      style: TextStyle(backgroundColor: Colors.green),
    ),
    const Text(
      '3333333333333',
      style: TextStyle(backgroundColor: Colors.blue),
    ),
    const Text(
      '444',
      style: TextStyle(backgroundColor: Colors.amber),
    ),
    const Text(
      '555',
      style: TextStyle(backgroundColor: Colors.amber),
    ),
    const Text(
      '666666666666',
      style: TextStyle(
        backgroundColor: Colors.black,
        color: Colors.white,
        letterSpacing: 2.0,
      ),
    ),
    Container(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      color: Colors.cyan,
      child: const Text('7777777777'),
    ),
    Container(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      color: Colors.cyan,
      child: const Text('888888888888888'),
    )
  ];
}
