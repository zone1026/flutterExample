// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YZCupertinoDatePickerWidget extends StatelessWidget {
  const YZCupertinoDatePickerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Text(
          "CupertinoDatePicker",
        ),
      ),
      body: ListView(
        children: [
          const Text(
            "CupertinoDatePicker dateAndTime",
          ),
          _cupertinoDatePicker(CupertinoDatePickerMode.dateAndTime),
          const Text(
            "CupertinoDatePicker date",
          ),
          _cupertinoDatePicker(CupertinoDatePickerMode.date),
          const Text(
            "CupertinoDatePicker time",
          ),
          _cupertinoDatePicker(CupertinoDatePickerMode.time),
        ],
      ),
    );
  }

  SizedBox _cupertinoDatePicker(CupertinoDatePickerMode mode) {
    DateTime now = DateTime.now();
    return SizedBox(
      height: 200.0,
      child: CupertinoDatePicker(
        // 展示模式, 默认为 dateAndTime
        mode: mode,
        // 默认选中日期
        initialDateTime: DateTime(now.year, now.month, now.day),
        // 最小可选日期
        minimumDate: now.add(const Duration(days: -10)),
        // 最大可选日期
        maximumDate: now.add(const Duration(days: 10)),
        // 分钟间隔
        minuteInterval: 10,
        // 是否采用24小时制
        use24hFormat: true,
        // 背景色
        backgroundColor: Colors.yellow,
        // 日期发生变化
        onDateTimeChanged: (dateTime) {
          print('onDateTimeChanged:$dateTime');
        },
      ),
    );
  }
}
