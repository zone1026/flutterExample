// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 一个child普通widget的Sliver容器组件
/// 如果是滑动的组件不推荐使用这个，而是使用Sliver滑动组件
class YZSliverToBoxAdapterWidget extends StatelessWidget {
  const YZSliverToBoxAdapterWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SliverToBoxAdapter',
        ),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverPadding(padding: EdgeInsets.only(top: 15.0)),
          // sliver组件中使用普通组件的方法
          SliverToBoxAdapter(
            child: Center(
              child: Text('SliverToBoxAdapter Text'),
            ),
          )
        ],
      ),
    );
  }
}
