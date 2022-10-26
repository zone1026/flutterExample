// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 占满一屏或者比一屏更多的布局，
class YZSliverFillViewprotWidget extends StatelessWidget {
  const YZSliverFillViewprotWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SliverFillViewprot',
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillViewport(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              height: 64.0,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }))
        ],
      ),
    );
  }
}
