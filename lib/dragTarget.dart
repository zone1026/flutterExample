// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZDragTargetWidget extends StatelessWidget {
  const YZDragTargetWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DragTarget',
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _stack(),
      ),
    );
  }
}

/// builder：candidateData为onWillAccept回调为true时可接收的数据列表，rejectedData为onWillAccept回调为false时拒绝时的数据列表
/// onWillAccept：当拖拽锚点进入DragTarget范围时回调，true时会将Data数据添加到candidateData列表中；false时会将Data数据添加到rejectedData列表中；
/// onAccept：接收Data数据，只有onWillAccept返回true且拖拽结束时拖拽锚点位于DragTarget内才会回调
/// onAcceptWithDetails：跟onAccept一样，只是多了Offset的属性
/// onLeave：拖拽锚点进入DragTarget范围后再离开DragTarget范围时回调
/// onMove：拖拽锚点进入DragTarget范围后在DragTarget范围内移动时回调
Stack _stack() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: 10.0,
        left: 10.0,
        child: Draggable(
          data: 'one',
          feedback: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.green,
            child: _text('one'),
          ),
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.red,
            child: _text('one'),
          ),
        ),
      ),
      Positioned(
        top: 10.0,
        right: 10.0,
        child: Draggable(
          data: 'two',
          feedback: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.green,
            child: _text('two'),
          ),
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.red,
            child: _text('two'),
          ),
        ),
      ),
      Positioned(
        child: DragTarget(
          builder: (BuildContext context, List<Object?> candidateData,
              List<dynamic> rejectedData) {
            Color color;
            String text;
            if (candidateData.isNotEmpty && candidateData.first == 'one') {
              color = Colors.red;
              text = '接收到one';
            } else if (rejectedData.isNotEmpty) {
              color = Colors.green;
              text = '未接收到one，接收为${rejectedData.first}';
            } else {
              color = Colors.blue;
              text = '未接收到数据';
            }
            return Container(
              width: 100.0,
              height: 100.0,
              color: color,
              child: _text(text),
            );
          },
          onWillAccept: (data) {
            print('onWillAccept $data');
            if (data == 'one') {
              return true;
            }

            return false;
          },
          onAccept: (data) {
            print('onAccept $data');
          },
          onAcceptWithDetails: (details) {
            print('onAcceptWithDetails $details');
          },
          onLeave: (data) {
            print('onLeave $data');
          },
          onMove: (details) {
            print('onMove $details');
          },
        ),
      ),
    ],
  );
}

Text _text(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
    ),
  );
}
