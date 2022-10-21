// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 绝对布局
class YZStackWidget extends StatelessWidget {
  const YZStackWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stack',
        ),
      ),
      body: Container(
        width: 400.0,
        height: 600.0,
        color: Colors.grey,
        child: _stack(),
      ),
    );
  }

  Stack _stack() {
    return Stack(
      // 使用 alignment 对齐方式，来对没有位置约束的子组件进行约束。
      alignment: Alignment.topRight,
      // 布局方向
      textDirection: TextDirection.ltr,
      // 填充方式
      fit: StackFit.loose,
      // 剪切方式
      clipBehavior: Clip.none,
      // 子控件
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          color: Colors.red,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(),
          child: const Text(
            '一行文字',
            style: TextStyle(backgroundColor: Colors.yellow),
          ),
        ),
        _positionedForAll(),
        _positionedForLeftTop(),
        _positionedForClip(),
      ],
    );
  }

  // 四边约束，指定4个边的距离，这个 Positioned 会被拉伸，直到边距和设定一致
  Positioned _positionedForAll() {
    return Positioned(
      left: 150.0,
      top: 15.0,
      bottom: 10.0,
      right: 10.0,
      child: Container(
        color: Colors.cyan,
      ),
    );
  }

  // 位置约束，指定两边位置，设置过大小的 Container 就是绝对定位了
  Positioned _positionedForLeftTop() {
    return Positioned(
      left: 30.0,
      top: 30.0,
      child: Container(
        width: 200.0,
        height: 220.0,
        color: Colors.blue,
      ),
    );
  }

  // 超出父控件边界的约束
  Positioned _positionedForClip() {
    return Positioned(
      left: 30.0,
      top: 500.0,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.lightGreenAccent,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            print('button click');
          },
          child: const Text(
            'ElevatedButton',
            // style: TextStyle(backgroundColor: Colors.red),
          ),
        ),
      ),
    );
  }
}
