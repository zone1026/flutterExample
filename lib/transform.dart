// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';

/// 1.可以在其子组件绘制前对其应用一些矩阵变换来实现一些特效。
///
/// 2.这里需要注意的是这种变换特效是应用在绘制阶段而不是布局阶段
///
/// 3.也就是说子控件虽然进行了变换，但是他所占用的实际空间，位置等都是固定不变的，只是视觉上改变了。

class YZTransformWidget extends StatelessWidget {
  const YZTransformWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transform',
        ),
      ),
      // body: _rotate(),
      // body: _translate(),
      // body: _scale(),
      // body: _transform(),
      // body: _rotation(),
      // body: _skew(),
      body: _center(),
    );
  }
}

/// alignment: Alignment.center：以alignment位置为原点旋转
///
/// angle：旋转弧度 注意这里不是角度，需要将角度转为弧度，180度 = π弧度 即1度＝π/180 弧度
///
/// origin：以某一个原点旋转，这个是相对于alignment位置所设置的Offset的偏移点为原点旋转
Stack _rotate() {
  return Stack(
    children: [
      Center(
        child: _text('hello flutter 1'),
      ),
      Center(
        child: Transform.rotate(
          angle: pi * 0.25,
          alignment: Alignment.center,
          child: _text('hello flutter 2'),
        ),
      ),
      Center(
        child: Transform.rotate(
          angle: pi * 0.25,
          origin: const Offset(50.0, 50.0),
          alignment: Alignment.center,
          child: _text('hello flutter 3'),
        ),
      ),
      Center(
        child: Transform.rotate(
          angle: pi * 0.25,
          alignment: null,
          child: _text('hello flutter 4'),
        ),
      ),
      Positioned(
        top: 15.0,
        left: 15.0,
        child: Transform.rotate(
          angle: pi * 0.5,
          alignment: null,
          child: _text('hello flutter 5'),
        ),
      ),
    ],
  );
}

/// offset：Offset 偏移位置
Stack _translate() {
  return Stack(
    children: [
      Center(
        child: Transform.translate(
          offset: const Offset(0.0, 0.0),
          child: _text('hello flutter 1'),
        ),
      ),
      Center(
        child: Transform.translate(
          offset: const Offset(50.0, 50.0),
          child: _text('hello flutter2'),
        ),
      )
    ],
  );
}

/// scale：缩放系数
/// origin：以某一个原点缩放，这个是相对于alignment位置所设置的Offset的偏移点为原点缩放
/// alignment = Alignment.center：以alignment位置为原点缩放
Stack _scale() {
  return Stack(
    children: [
      Center(
        child: Transform.scale(
          scale: 2.0,
          alignment: Alignment.center,
          child: _text('hello flutter 1'),
        ),
      ),
      Center(
        child: Transform.scale(
          scale: 1.0,
          origin: const Offset(0.0, 0.0),
          alignment: Alignment.center,
          child: _text('hello flutter 2'),
        ),
      ),
      Center(
        child: Transform.scale(
          scale: 2.0,
          origin: const Offset(50.0, 50.0),
          alignment: Alignment.center,
          child: _text('hello flutter 3'),
        ),
      ),
    ],
  );
}

Stack _transform() {
  return Stack(
    children: [
      Center(
        child: _text('hello flutter 1'),
      ),
      Center(
        child: Transform(
          transform: Matrix4.translationValues(50.0, 50.0, 0.0),
          alignment: Alignment.center,
          child: _text('hello flutter 2'),
        ),
      ),
    ],
  );
}

Stack _rotation() {
  return Stack(
    children: [
      Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 50.0),
          child: _text('hello flutter 1'),
        ),
      ),
      Center(
        child: Transform(
          /// X轴旋转，旋转弧度大于0就是由Y轴正方向向Z轴正方向旋转，小于0就是Z轴正方向向Y轴正方向旋转
          transform: Matrix4.rotationX(pi * 0.75),
          alignment: Alignment.center,
          child: _text('hello flutter 2'),
        ),
      ),
      Center(
        child: Transform(
          /// 沿Y轴旋转，旋转弧度大于0就是由X轴正方向向Z轴正方向旋转，小于0就是Z轴正方向向X轴正方向旋转
          transform: Matrix4.rotationY(pi * 0.75),
          alignment: Alignment.center,
          child: _text('hello flutter 3'),
        ),
      ),
      Center(
        child: Transform(
          /// 沿Z轴旋转，旋转弧度大于0就是由Y轴正方向向X轴正方向旋转，小于0就是X轴正方向向Y轴正方向旋转
          transform: Matrix4.rotationZ(pi * 0.25),
          alignment: Alignment.center,
          child: _text('hello flutter 4'),
        ),
      )
    ],
  );
}

Stack _skew() {
  return Stack(
    children: [
      Center(
        child: Transform(
          /// 沿X轴扭曲
          transform: Matrix4.skewX(pi * 0.25),
          alignment: Alignment.center,
          child: _text('hello flutter 1'),
        ),
      ),
      Center(
        child: Transform(
          /// 沿Y轴扭曲
          transform: Matrix4.skewY(pi * 0.25),
          alignment: Alignment.center,
          child: _text('hello flutter 2'),
        ),
      ),
      Center(
        child: Transform(
          transform: Matrix4.skew(pi * 0.2, pi * 0.1),
          alignment: Alignment.center,
          child: _text('hello flutter 3'),
        ),
      )
    ],
  );
}

/// 验证Transform变换是在绘制阶段而不是在布局阶段
/// 可以看到前一个“Hello Flutter”放大后并没有影响后面一个的位置，由此也可以看出变换是绘制阶段而不是在布局阶段。
/// 这种矩阵变换的优点就是发生在绘制阶段，他不需要去重新布局或者构建，对性能上很友好。
Center _center() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 2.0,
          alignment: Alignment.center,
          child: _text('hello flutter 1'),
        ),
        _text('hello flutter 2'),
      ],
    ),
  );
}

Text _text(String text) {
  return Text(
    text,
    style: const TextStyle(
      backgroundColor: Colors.red,
      fontSize: 20.0,
      color: Colors.white,
    ),
  );
}
