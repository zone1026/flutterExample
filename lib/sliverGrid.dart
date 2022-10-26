// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// Sliver组件中的GridView
class YZSliverGradWidget extends StatelessWidget {
  const YZSliverGradWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SliverGrid',
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: _sliverChildBuilderDelegate(),
            // gridDelegate: _sliverGridDelegateWithFixedCrossAxisCount(),
            gridDelegate: _sliverGridDelegateWithMaxCrossAxisExtent(),
          )
        ],
      ),
    );
  }

  SliverChildBuilderDelegate _sliverChildBuilderDelegate() {
    return SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          color: Colors.primaries[index % Colors.primaries.length],
          alignment: Alignment.center,
          child: Text('index = $index'),
        );
      },
      childCount: 25,
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount
      _sliverGridDelegateWithFixedCrossAxisCount() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }

  SliverGridDelegateWithMaxCrossAxisExtent
      _sliverGridDelegateWithMaxCrossAxisExtent() {
    return const SliverGridDelegateWithMaxCrossAxisExtent(
      // 副轴方向child的最大长度，
      // 例如：值为200，设置垂直滚动，那就是水平方向上child的最大【宽度】就是200，
      // 如果父控件最大允许宽度是500，只能放下2.5个，个数取3，那么child的宽度就会变成500/3
      maxCrossAxisExtent: 200,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}
