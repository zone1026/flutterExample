import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// iOS 风格的加载菊花
class YZCupertinoActivityIndicatorWidget extends StatefulWidget {
  const YZCupertinoActivityIndicatorWidget({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _YZCupertinoActivityIndicatorWidgetSate createState() =>
      _YZCupertinoActivityIndicatorWidgetSate();
}

class _YZCupertinoActivityIndicatorWidgetSate
    extends State<YZCupertinoActivityIndicatorWidget> {
  double _progress = 0.0;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      _progress += 0.1;
      if (_progress > 1.0) {
        _progress = 0.0;
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
        title: const Text('title'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.all(30.0)),
            const CupertinoActivityIndicator(
              // 是否有动画，默认为 true
              animating: true,
              // radius: 20.0,
              color: Colors.black,
            ),
            const Padding(padding: EdgeInsets.all(30.0)),
            const CupertinoActivityIndicator(
              animating: false,
              // 大小，默认为 10
              radius: 20.0,
              color: Colors.red,
            ),
            const Padding(padding: EdgeInsets.all(30.0)),
            const CupertinoActivityIndicator.partiallyRevealed(
              color: Colors.red,
              // 大小，默认为 10
              radius: 30.0,
            ),
            const Padding(padding: EdgeInsets.all(30.0)),
            CupertinoActivityIndicator.partiallyRevealed(
              color: Colors.red,
              radius: 50.0,
              // 当前进度，默认为 1.0，注意大于1时会报错
              progress: _progress,
            )
          ],
        ),
      ),
    );
  }
}
