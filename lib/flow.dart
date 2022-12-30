// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as Vector;

class YZFlowWidget extends StatelessWidget {
  const YZFlowWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flow',
        ),
      ),
      body: Flow(
        delegate: _CustomFlowDelegate(),
        children: _children(),
      ),
    );
  }
}

List<Widget> _children() {
  return [
    Container(
      color: Colors.red,
      width: 80.0,
      height: 50.0,
    ),
    Container(
      color: Colors.green,
      width: 180.0,
      height: 50.0,
    ),
    Container(
      color: Colors.blue,
      width: 280.0,
      height: 50.0,
    ),
    Container(
      color: Colors.amber,
      width: 380.0,
      height: 50.0,
    ),
    Container(
      color: Colors.black,
      width: 110.0,
      height: 50.0,
    ),
    Container(
      color: Colors.cyan,
      width: 80.0,
      height: 50.0,
    ),
  ];
}

/// Flow支持按你想要的方式去实现布局
class _CustomFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    var dx = 0.0;
    var dy = 0.0;
    for (int i = 0; i < context.childCount; i++) {
      if (dx + context.getChildSize(i)!.width < context.size.width) {
        print('flow layout');
      } else {
        // 折行展示
        dx = 0.0;
        dy += context.getChildSize(i)!.height;
      }

      context.paintChild(
        i,
        // transform: Matrix4.compose(
        //   Vector.Vector3(dx, dy, 0.0),
        //   Vector.Quaternion(0.0, 0.0, 0.0, 0.0),
        //   Vector.Vector3(1, 1, 1),
        // ),
        transform: Matrix4.translationValues(dx, dy, 0.0),
      );
      dx += context.getChildSize(i)!.width;
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 获取父容器约束条件确定Flow大小
    return super.getSize(constraints);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return super.getConstraintsForChild(i, constraints);
  }

  @override
  bool shouldRelayout(covariant FlowDelegate oldDelegate) {
    // 是否需要relayout
    return false;
  }
}
