// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

/// GridView矩阵式列表（网格布局）UICollectView
class YZGridViewWidget extends StatelessWidget {
  const YZGridViewWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GridView',
        ),
      ),
      body: _countGridView(),
      // body: _builderGridView(),
    );
  }

  GridView _countGridView() {
    return GridView.count(
      // 设置滚动方向
      scrollDirection: Axis.vertical,
      // scrollDirection十字交叉方向上的间距
      crossAxisSpacing: 8.0,
      // 主轴scrollDirection间距
      mainAxisSpacing: 8.0,
      // 设置列数
      crossAxisCount: 3,
      // 内边距
      padding: const EdgeInsets.all(8.0),
      // 网格列表子widget
      children: _gridViewChildWidgets(),
    );
  }

  GridView _builderGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // 设置列数
        crossAxisCount: 3,
        // scrollDirection十字交叉方向上的间距
        crossAxisSpacing: 8.0,
        // 主轴scrollDirection间距
        mainAxisSpacing: 8.0,
      ),
      // 设置滚动方向
      scrollDirection: Axis.vertical,
      // 子组件的数量
      itemCount: 20,
      // 内边距
      padding: const EdgeInsets.all(8.0),
      // 子组件的构造
      itemBuilder: (context, index) {
        return _itemWidget(index);
      },
    );
  }

  List<Widget> _gridViewChildWidgets() {
    List<Widget> list = [];
    for (var i = 0; i < 13; i++) {
      list.add(_itemWidget(i));
    }
    return list;
  }

  Container _itemWidget(int index) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black45, width: 1.0)),
      child: Stack(
        // 使用 alignment 对齐方式，来对没有位置约束的子组件进行约束。
        alignment: Alignment.topLeft,
        // 布局方向
        textDirection: TextDirection.ltr,
        // 填充方式
        fit: StackFit.loose,
        // 剪切方式
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            bottom: 30.0,
            child: Image.network(
              Constants.imageUlr,
              fit: BoxFit.fitWidth,
              color: Colors.red,
            ),
          ),
          Positioned(
            left: 4.0,
            right: 4.0,
            bottom: 8.0,
            height: 16.0,
            child: Text(
              'title = $index',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
