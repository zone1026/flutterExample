// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// 一个使用slivers创建自定义的滚动效果的ScrollView
/// 这个是以Sliver组件中基础的组件，支持讲各种Sliver组件聚合在一起实现各种折叠效果
class YZCustomScrollViewWidget extends StatelessWidget {
  const YZCustomScrollViewWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CustomScrollView',
        ),
      ),
      body: CustomScrollView(
        // 滚动方向
        scrollDirection: Axis.vertical,
        // 是否slivers内的组件倒序展示
        reverse: false,
        // 当内容不足以滚动时，是否支持滚动 但是这里是不起作用的，因为CustomScrollView需要内容满了才能触发折叠效果，true 的话 controller 一定要为null
        primary: true,
        // 滚动偏移位置比例，会在滚动方向上进行整体位置偏移 0～1
        anchor: 0.1,
        // ScrollPhysics 控制用户滚动视图的交互
        physics: const BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        slivers: [
          SliverLayoutBuilder(builder: (context, constraints) {
            Color color = Colors.red;
            if (constraints.userScrollDirection == ScrollDirection.forward) {
              // 向前（沿着滑动方向运动）时
              color = Colors.green;
            } else if (constraints.userScrollDirection ==
                ScrollDirection.idle) {
              // 空闲时
              color = Colors.blue;
            }

            return SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                color: color,
              ),
            );
          }),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height: 64.0,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            },
            childCount: 20,
          )),
        ],
      ),
    );
  }
}
