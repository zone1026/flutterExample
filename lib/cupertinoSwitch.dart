import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class YZCupertinoSwitchWidget extends StatefulWidget {
  const YZCupertinoSwitchWidget({Key? key}) : super(key: key);
  @override
  YZCupertinoSwitchWidgetState createState() => YZCupertinoSwitchWidgetState();
}

class YZCupertinoSwitchWidgetState extends State<YZCupertinoSwitchWidget> {
  bool _switchSelected = false;
  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(30.0)),
            const Text('Normal Switch'),
            CupertinoSwitch(
              value: _switchSelected,
              onChanged: (value) {
                _switchSelected = value;
                setState(() {});
              },
            ),
            const Padding(padding: EdgeInsets.all(15.0)),
            const Text('Custom Switch'),
            CupertinoSwitch(
              value: _switchSelected,
              onChanged: (value) {
                _switchSelected = value;
                setState(() {});
              },
              // 开关打开时，轨道颜色
              activeColor: Colors.red,
              // 滑块颜色
              thumbColor: Colors.green,
              // 开关关闭时，轨道颜色
              trackColor: Colors.grey,
              // 拖拽效果，默认为 start 更为平滑，为 down 时有明显吸附效果
              dragStartBehavior: DragStartBehavior.down,
            ),
          ],
        ),
      ),
    );
  }
}
