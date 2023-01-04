// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 长按拖拽组件，跟Draggable几乎一样，但是需要长按才能拖拽
class YZLongPressDraggableWidget extends StatelessWidget {
  const YZLongPressDraggableWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LongPressDraggable',
        ),
      ),
      body: Center(
        child: _draggable(),
      ),
    );
  }
}

/// child：子组件，未进行拖拽时显示
/// feedback：跟随拖拽的组件
/// data：用于对DragTarget传递data
/// axis：Axis 拖拽方向，可以设置只能横向或者纵向拖拽
/// childWhenDragging：拖拽时child子组件显示样式
/// feedbackOffset = Offset.zero：
/// dragAnchor = DragAnchor.child：拖拽的锚地位置
/// ignoringFeedbackSemantics = true：当子child和feedback为同一个Widget时，可以设为false配合GlobalKey确保是同一个Widget 减少绘制
/// affinity：此部件与其它手势的竞争方式 在非affinity方向上不响应拖动事件,一般用于在滚动组件
/// maxSimultaneousDrags：同时支持拖动多少个点
/// onDragStarted：拖动开始时调用
/// onDraggableCanceled：在没有被DragTarget接受的情况下松开draggable时调用
/// onDragEnd：拖动结束时调用
/// onDragCompleted：Draggable被删除并被DragTarget接受时调用
LongPressDraggable _draggable() {
  return LongPressDraggable(
    feedbackOffset: const Offset(0.0, 10.0),
    onDragStarted: () {
      print('onDragStarted');
    },
    onDragEnd: (details) {
      print('onDragEnd $details');
    },
    onDragUpdate: (details) {
      print('onDragUpdate $details');
    },
    onDraggableCanceled: (velocity, offset) {
      print('onDraggableCanceled velocity:$velocity, offset:$offset');
    },
    onDragCompleted: () {
      print('onDragCompleted');
    },
    childWhenDragging: Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue,
    ),
    feedback: Container(
      width: 100.0,
      height: 100.0,
      color: Colors.green,
    ),
    child: Container(
      width: 100.0,
      height: 100.0,
      color: Colors.red,
    ),
  );
}
