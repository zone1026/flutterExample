// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

/// 可以嵌套可滚动widget的widget
/// NestedScrollView的头部需要sliver组件，但是body可以使用非sliver组件，这是CustomScrollView无法实现的。
class YZNestedScrollViewWidget extends StatelessWidget {
  const YZNestedScrollViewWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: const Text('NestedScrollView'),
                backgroundColor: Colors.cyan,
                expandedHeight: 160.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    Constants.imageUlr,
                    fit: BoxFit.cover,
                  ),
                  // 背景跟随滚动但是具有滚动视差效果
                  collapseMode: CollapseMode.parallax,
                ),
              ),
            )
          ];
        },

        // body: ListView.builder(
        //   itemBuilder: (context, index) {
        //     return _itemWidget(index);
        //   },
        //   itemCount: 20,
        // ),

        // ListView是无法得到准确的头部展开折叠高度的，
        // 那么flutter提供了解决方案：SliverOverlapAbsorber+SliverOverlapInjector

        body: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return _itemWidget(index);
                    },
                    childCount: 20,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Container _itemWidget(int index) {
    return Container(
      color: Colors.red,
      child: ListTile(
        title: Text('index = $index'),
      ),
    );
  }
}
