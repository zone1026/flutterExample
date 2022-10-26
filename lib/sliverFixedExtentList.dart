// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

/// 可以统一指定Item固定高度的SliverList
class YZSliverFixedExtentListWidget extends StatelessWidget {
  const YZSliverFixedExtentListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SliverFixedExtentList',
        ),
      ),
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverFixedExtentList(
              // SliverChildDelegate
              // delegate: _sliverChildBuilderDelegate(),
              delegate: _sliverChildListDelegate(),
              // item高度
              itemExtent: 44.0,
            ),
          ],
        ),
      ),
    );
  }

  SliverChildBuilderDelegate _sliverChildBuilderDelegate() {
    return SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Text('index = $index'),
        );
      },
      childCount: 30,
    );
  }

  SliverChildListDelegate _sliverChildListDelegate() {
    return SliverChildListDelegate([
      Image.network(
        Constants.imageUlr,
        color: Colors.cyan,
      ),
      Container(
        color: Colors.red,
        child: const Text('index = 0'),
      ),
      Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text('index = 1'),
      ),
      Container(
        color: Colors.blue,
        child: const Text('index = 2'),
      ),
    ]);
  }
}
