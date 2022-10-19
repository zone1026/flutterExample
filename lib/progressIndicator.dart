import 'dart:async';

import 'package:flutter/material.dart';

/// LinearProgressIndicator、CircularProgressIndicator 是 flutter 提供的一个线性和圆形进度条
class YZProgressIndicatorWidget extends StatefulWidget {
  const YZProgressIndicatorWidget({Key? key}) : super(key: key);
  @override
  YZProgressIndicatorWidgetState createState() =>
      YZProgressIndicatorWidgetState();
}

class YZProgressIndicatorWidgetState extends State<YZProgressIndicatorWidget> {
  double _count = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    initTimer();
  }

  void initTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      _count += 1.0;
      if (_count > 100) {
        _count = 0.0;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("ProgressIndicator"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("一直动的进度条"),
            ),
            const LinearProgressIndicator(),
            const Padding(
              padding: EdgeInsets.all(20.0),
            ),
            const SizedBox(
              width: 100.0,
              height: 100.0,
              child: CircularProgressIndicator(),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("自定义样式与进度的进度条"),
            ),
            _linearProgressIndicator(),
            const Padding(
              padding: EdgeInsets.all(20.0),
            ),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: _circularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  LinearProgressIndicator _linearProgressIndicator() {
    return LinearProgressIndicator(
      // 当前进度
      value: _count / 100.0,
      // 进度条背景色
      backgroundColor: Colors.yellow,
      // 进度条当前进度颜色
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
      // 最小宽度
      minHeight: 10.0,
    );
  }

  CircularProgressIndicator _circularProgressIndicator() {
    return CircularProgressIndicator(
      // 当前进度
      value: _count / 100.0,
      // 最小宽度
      strokeWidth: 10.0,
      // 进度条背景色
      backgroundColor: Colors.yellow,
      // 进度条当前进度颜色
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
    );
  }
}
