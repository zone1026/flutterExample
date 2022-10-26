// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// Sliver需要配合CustomScrollView使用
///SliverList 与 ListView 类似
class YZSliverListWidget extends StatelessWidget {
  const YZSliverListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SliverList',
        ),
      ),
      body: CustomScrollView(slivers: [
        // 处理安全区域
        SliverSafeArea(
          sliver: SliverList(
            delegate: _sliverChildBuilderDelegate(),
            // delegate: _sliverChildListDelegate(),
          ),
        )
      ]),
    );
  }

  SliverChildBuilderDelegate _sliverChildBuilderDelegate() {
    return SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          height: 65.0,
          color: Colors.primaries[index % Colors.primaries.length],
          alignment: Alignment.center,
          child: Text('title = $index'),
        );
      },
      childCount: 22,
    );
  }

  SliverChildListDelegate _sliverChildListDelegate() {
    return SliverChildListDelegate([
      Container(
        height: 25.0,
        color: Colors.red,
        alignment: Alignment.center,
        child: const Text('title = 0'),
      ),
      Container(
        height: 55.0,
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text('title = 1'),
      ),
      Container(
        height: 85.0,
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text('title = 2'),
      ),
    ]);
  }
}
