// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YZCupertinoTimerPickerWidget extends StatelessWidget {
  const YZCupertinoTimerPickerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Text(
          "CupertinoTimerPicker",
        ),
      ),
      body: ListView(
        children: [
          const Text(
            "CupertinoTimerPicker hms",
          ),
          _cupertinoTimerPicker(CupertinoTimerPickerMode.hms),
          const Text(
            "CupertinoTimerPicker hm",
          ),
          _cupertinoTimerPicker(CupertinoTimerPickerMode.hm),
          const Text(
            "CupertinoTimerPicker ms",
          ),
          _cupertinoTimerPicker(CupertinoTimerPickerMode.ms)
        ],
      ),
    );
  }

  CupertinoTimerPicker _cupertinoTimerPicker(CupertinoTimerPickerMode mode) {
    return CupertinoTimerPicker(
      // 展示模式
      mode: mode,
      // 默认选中事时间
      initialTimerDuration: const Duration(hours: 5, minutes: 10, seconds: 30),
      // 分钟间隔
      minuteInterval: 10,
      // 秒间隔
      secondInterval: 10,
      // 对齐方式
      alignment: Alignment.center,
      // 背景颜色
      backgroundColor: Colors.cyan,
      // 滑动后，每次改变回调函数
      onTimerDurationChanged: (duration) {
        print(duration);
      },
    );
  }
}
