// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 拖拽组件
class YZDraggableWidget extends StatelessWidget {
  const YZDraggableWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Draggable',
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
Draggable _draggable() {
  return Draggable(
    data: 'draggable data',
    // axis: Axis.vertical,
    childWhenDragging: Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue,
    ),
    feedbackOffset: const Offset(10.0, 10.0),
    onDragStarted: () {
      print('onDragStarted');
    },
    onDraggableCanceled: (velocity, offset) {
      print('onDraggableCanceled velocity:$velocity, offset:$offset');
    },
    onDragEnd: (details) {
      print("onDragEnd : $details");
    },
    onDragUpdate: (details) {
      print("onDragUpdate : $details");
    },
    onDragCompleted: () {
      print('onDragCompleted');
    },
    feedback: Container(
      width: 120.0,
      height: 120.0,
      color: Colors.green,
      child: const Text(
        'data',
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    child: Container(
      width: 100.0,
      height: 100.0,
      color: Colors.red,
      child: const Text('data'),
    ),
  );
}
