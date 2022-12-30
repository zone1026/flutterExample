// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 使用一个委托来对多个child进行设置大小和定位的小部件
class YZCustomMultiChildLayoutWidget extends StatelessWidget {
  const YZCustomMultiChildLayoutWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CustomMultiChildLayout',
        ),
      ),
      body: _MultiChildLayout(
        children: [
          LayoutId(
            id: 'A',
            child: Container(
              width: 50.0,
              height: 50.0,
              color: Colors.red,
            ),
          ),
          LayoutId(
            id: 'B',
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.green,
            ),
          ),
          LayoutId(
            id: 'C',
            child: Container(
              width: 50.0,
              height: 120.0,
              color: Colors.blue,
            ),
          ),
          LayoutId(
            id: 'D',
            child: Container(
              width: 120.0,
              height: 50.0,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}

class _MultiChildLayout extends CustomMultiChildLayout {
  _MultiChildLayout({Key? key, List<Widget> children = const <Widget>[]})
      : super(
          key: key,
          delegate: _CustomMultiChildLayoutDelegate(children),
          children: children,
        );
}

class _CustomMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  late List<String> layoutIds;
  Map<String, Size> sizeMap = {};

  _CustomMultiChildLayoutDelegate(List<Widget> children) {
    layoutIds = _getLayoutIds(children);
  }

  List<String> _getLayoutIds(List<Widget> children) {
    return children.map((e) {
      return (e as LayoutId).id as String;
    }).toList();
  }

  @override
  void performLayout(Size size) {
    for (String id in layoutIds) {
      if (hasChild(id)) {
        sizeMap[id] = layoutChild(id, const BoxConstraints());
        switch (id) {
          case 'A':
            positionChild(id, Offset.zero);
            break;
          case 'B':
            positionChild(id, Offset(sizeMap['A']!.width, 0.0));
            break;
          case 'C':
            positionChild(id, Offset(0.0, sizeMap['A']!.height));
            break;
          case 'D':
            positionChild(
                id, Offset(sizeMap['C']!.width, sizeMap['B']!.height));
            break;
          default:
        }
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    sizeMap.clear();
    return true;
  }

  @override
  void positionChild(Object childId, Offset offset) {
    // 定位子组件
    super.positionChild(childId, offset);
  }

  @override
  Size layoutChild(Object childId, BoxConstraints constraints) {
    // 确定child的约束，用于确定child的大小
    return super.layoutChild(childId, constraints);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 获取父容器约束条件确定CustomSingleChildLayout大小
    return super.getSize(constraints);
  }

  @override
  String toString() {
    return super.toString();
  }

  @override
  bool hasChild(Object childId) {
    // 子组件是否存在
    return super.hasChild(childId);
  }
}
