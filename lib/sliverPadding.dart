// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 设置Sliver的内边距
class YZSliverPaddingWidget extends StatelessWidget {
  const YZSliverPaddingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SliverPadding',
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 15.0),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.red,
                  child: const Text('index = 0'),
                ),
                Container(
                  color: Colors.green,
                  child: const Text('index = 1'),
                ),
                Container(
                  color: Colors.blue,
                  child: const Text('index = 2'),
                ),
              ]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(15.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 64.0,
                  color: Colors.primaries[index % Colors.primaries.length],
                  alignment: Alignment.center,
                  child: Text('index = $index'),
                );
              }, childCount: 20),
            ),
          ),
        ],
      ),
    );
  }
}
