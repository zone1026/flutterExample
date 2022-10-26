// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

/// 可以根据滚动而变大变小的组件，SliverAppBar就是基于这个实现的
class YZSliverPersistentHeaderWidget extends StatelessWidget {
  const YZSliverPersistentHeaderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'SliverPersistentHeader',
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: YZSliverPersistentHeaderDelegate()),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 64.0,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}

/// 自定义SliverPersistentHeaderDelegate代理
class YZSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  // 创建child子组件
  // shrinkOffset：child偏移值minExtent~maxExtent
  // overlapsContent：SliverPersistentHeader覆盖其他子组件返回true，否则返回false
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(Constants.imageUlr),
        fit: BoxFit.cover,
      )),
    );
  }

  // SliverPersistentHeader最大高度
  @override
  double get maxExtent => 260.0;

  // SliverPersistentHeader最小高度
  @override
  double get minExtent => 86.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw false;
  }
}
