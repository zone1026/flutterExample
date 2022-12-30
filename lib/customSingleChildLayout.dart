// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';

class YZCustomSingleChildLayoutWidget extends StatelessWidget {
  const YZCustomSingleChildLayoutWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CustomSingleChildLayout',
        ),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 15.0)),
          _container(Colors.red, 50.0, 50.0),
          const Padding(padding: EdgeInsets.only(top: 15.0)),
          _container(Colors.green, 150.0, 50.0),
          const Padding(padding: EdgeInsets.only(top: 15.0)),
          _container(Colors.blue, 150.0, 150.0),
        ],
      ),
    );
  }
}

Center _container(Color color, double width, double height) {
  return Center(
    child: Container(
      color: color,
      width: width,
      height: height,
      child: _LoadingLayout(
        isLoading: Random().nextBool(),
      ),
    ),
  );
}

class _LoadingLayout extends CustomSingleChildLayout {
  _LoadingLayout({Key? key, bool isLoading = false})
      : super(
          key: key,
          delegate: _LoadingLayoutDelegate(),
          child: isLoading
              ? const CircularProgressIndicator(
                  value: null,
                )
              : Image.asset('assets/images/icon_phone.png'),
        );
}

class _LoadingLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  // ignore: unnecessary_overrides
  Size getSize(BoxConstraints constraints) {
    // 获取父容器约束条件确定CustomSingleChildLayout大小
    return super.getSize(constraints);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    // 是否需要re layout
    return false;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // 确定child的约束，用于确定child的大小
    var childWidth = min(constraints.maxWidth, constraints.maxHeight);
    var childBoxConstraints =
        BoxConstraints.tight(Size(childWidth / 2.0, childWidth / 2.0));
    return childBoxConstraints;
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // 确定child的位置，返回一个相对于parent的偏移值
    // size是layout的大小，由getSize确定
    // childSize由getConstraintsForChild得出的Constraints对child进行约束，得到child自身的size
    var dx = (size.width - childSize.width) / 2.0;
    var dy = (size.height - childSize.height) / 2.0;
    return Offset(dx, dy);
  }
}
