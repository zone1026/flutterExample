// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 拖拽滚动布局，非常方便的实现的拖拽面板
class YZDraggableScrollableWidget extends StatelessWidget {
  const YZDraggableScrollableWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DraggableScrollable',
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.red,
          ),
          _listener(),
        ],
      ),
    );
  }
}

NotificationListener _listener() {
  return NotificationListener<DraggableScrollableNotification>(
    onNotification: (notification) {
      print('拖拽布局最小高度 minExtent = ${notification.minExtent}');
      print('拖拽布局最大高度 maxExtent = ${notification.maxExtent}');
      print('拖拽布局初始化高度 initialExtent = ${notification.initialExtent}');
      print('拖拽布局当前高度extent = ${notification.extent}');

      return true;
    },
    child: DraggableScrollableSheet(
      // 拖拽布局初始化高度占父节点的比例
      initialChildSize: 0.5,
      // 拖拽布局最小高度占父节点的比例
      minChildSize: 0.25,
      // 拖拽布局最大高度占父节点的比例
      maxChildSize: 0.8,
      // 拖拽布局是否展开，false：拖拽布局的尺寸约束为当前尺寸，
      // true：拖拽布局的尺寸约束为撑满父节点
      expand: true,
      // 内部需要是滑动布局，设置滑动布局的ScrollController为builder中的ScrollController
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('item index : $index'),
              );
            },
            itemCount: 20,
            controller: scrollController,
          ),
        );
      },
    ),
  );
}
