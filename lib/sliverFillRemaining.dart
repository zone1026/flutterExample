// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

/// 滑动剩余部分展示的布局
class YZSliverFillRemainingWidget extends StatefulWidget {
  const YZSliverFillRemainingWidget({Key? key}) : super(key: key);
  @override
  _YZSliverFillRemainingWidgetState createState() =>
      _YZSliverFillRemainingWidgetState();
}

class _YZSliverFillRemainingWidgetState
    extends State<YZSliverFillRemainingWidget>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: const Text("SliverFillRemaining"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            // SliverPersistentHeader收缩到最小高度的时候SliverPersistentHeader是否可见，
            // true：SliverPersistentHeader会以折叠高度固定显示在头部，
            // false：缩小到折叠高度后滑出页面
            pinned: true,
            delegate: YZSliverPersistentHeaderDelegate(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(Constants.imageUlr),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  TabBar(
                    tabs: const [
                      Tab(text: 'One'),
                      Tab(text: 'Two'),
                    ],
                    labelColor: Colors.green,
                    controller: controller,
                  )
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: const [
                Center(child: Text('Content One')),
                Center(child: Text('Content Two')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class YZSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  YZSliverPersistentHeaderDelegate({required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 260.0;

  @override
  double get minExtent => 64.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
