// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

class YZBoxWidget extends StatelessWidget {
  const YZBoxWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Box',
        ),
      ),
      // body: _overflowBox(),
      // body: _sizedOverflowBox(),
      body: _box(),
    );
  }
}

Column _box() {
  return Column(
    children: [
      Container(
        color: Colors.blue,
        child: SizedOverflowBox(
          size: const Size(100.0, 50.0),
          child: Container(
            width: 50.0,
            height: 50.0,
            color: Colors.amber,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 50.0),
        color: Colors.blue,
        constraints: const BoxConstraints(
          maxHeight: 50.0,
        ),
        child: SizedOverflowBox(
          size: const Size(100.0, 50.0),
          alignment: Alignment.topCenter,
          child: Container(
            width: 50.0,
            height: 80.0,
            color: Colors.amber,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 50.0),
        color: Colors.blue,
        height: 150.0,
        constraints: const BoxConstraints(maxHeight: 50.0),
        child: OverflowBox(
          alignment: Alignment.center,
          minWidth: 20.0,
          maxWidth: 100,
          minHeight: 20.0,
          maxHeight: 100.0,
          child: Container(
            width: 50.0,
            height: 120.0,
            color: Colors.amber,
          ),
        ),
      )
    ],
  );
}

/// alignment = Alignment.center：位置
/// minWidth：最小宽度，如果子控件宽度小于这个值，按这个值显示
/// maxWidth：最大宽度，如果子控件宽度大于这个值，按这个值显示
/// minHeight：最小高度，如果子控件高度小于这个值，按这个值显示
/// maxHeight：最大高度，如果子控件高度大于这个值，按这个值显示
/// child：
/// 如果OverflowBox不设置约束，那么OverflowBox将使用他父控件的约束；如果OverflowBox的子控件尺寸大于OverflowBox父控件，且OverflowBox的约束也大于OverflowBox父控件，这时候OverflowBox子项就会溢出显示。
/// 需要注意的是OverflowBox自己是没有宽高的，他的属性都是对子控件的约束而已，OverflowBox的尺寸是由他的父控件约束来决定的。这一点跟SizedOverflowBox是不一样的。SizedOverflowBox我们会在下一节讲，可以跟OverflowBox最个对比。
Container _overflowBox() {
  return Container(
    color: Colors.blue,
    // width: 200.0,
    height: 200.0,
    child: OverflowBox(
      alignment: Alignment.topCenter,
      minWidth: 20.0,
      maxWidth: 200.0,
      minHeight: 20.0,
      maxHeight: 400.0,
      child: Container(
        width: 50.0,
        height: 300.0,
        color: Colors.amber,
      ),
    ),
  );
}

/// 一个特定大小的widget，但是会将它的原始约束传递给子控件，它可能会溢出。
Container _sizedOverflowBox() {
  return Container(
    color: Colors.blue,
    child: SizedOverflowBox(
      alignment: Alignment.topCenter,
      size: const Size(100.0, 50.0),
      child: Container(
        width: 50.0,
        height: 80.0,
        color: Colors.amber,
      ),
    ),
  );
}
