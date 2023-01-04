// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class YZBuilderWidget extends StatelessWidget {
  const YZBuilderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Builder',
        ),
      ),
      body: Center(
        child: _sliverLayoutBuilder(),
      ),
    );
  }
}

/// 这个就是可以返回所依赖布局的约束
LayoutBuilder _layoutBuilder() {
  return LayoutBuilder(builder: (context, constraints) {
    return Container(
      width: 50.0,
      height: 50.0,
      color: Colors.red,
    );
  });
}

/// 通过这个可以创建一个支持局部刷新的widget树，
/// 你可以在StatelessWidget里面刷新某个布局，但是不需要改变成StatefulWidget；
/// 你也可以在StatefulWidget中使用做部分刷新而不需要刷新整个页面，
/// 这个刷新是不会调用Widget build(BuildContext context)刷新整个布局树的。
StatefulBuilder _statefulBuilder() {
  var color = Colors.red;
  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      return Container(
        width: 50.0,
        height: 50.0,
        color: color,
        child: InkWell(
          onTap: () {
            setState(() {});
            color = (color == Colors.red ? Colors.green : Colors.red);
          },
        ),
      );
    },
  );
}

/// 创建一个支持折叠的widget树
CustomScrollView _sliverLayoutBuilder() {
  var color = Colors.red;
  return CustomScrollView(
    physics: const BouncingScrollPhysics(),
    slivers: [
      SliverLayoutBuilder(
          builder: (BuildContext context, SliverConstraints constraints) {
        if (constraints.userScrollDirection == ScrollDirection.forward) {
          color = Colors.green;
        } else if (constraints.userScrollDirection == ScrollDirection.idle) {
          color = Colors.blue;
        } else {
          color = Colors.cyan;
        }

        return SliverToBoxAdapter(
          child: Container(
            height: 100.0,
            color: color,
          ),
        );
      }),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Card(
            child: Container(
              height: 50.0,
              color: Colors.primaries[index % 18],
            ),
          );
        },
        childCount: 18,
      ))
    ],
  );
}
