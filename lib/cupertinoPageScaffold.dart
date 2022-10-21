// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YZCupertinoPageScaffoldWidget extends StatelessWidget {
  const YZCupertinoPageScaffoldWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // 导航条
      navigationBar: _cupertinoNavigationBar(),
      // 页面背景色
      backgroundColor: Colors.cyan,
      // 子控件
      child: ListView(
        children: [],
      ),
    );
  }

  CupertinoNavigationBar _cupertinoNavigationBar() {
    return CupertinoNavigationBar(
      // 是否添加默认 leading，默认为 true。当 leading 为空会默认添加一个返回按钮
      automaticallyImplyLeading: true,
      // 是否添加默认 middle，默认为 true，如果 middle 为空，且当前 route 为 CupertinoPageRoute，会默认填充 route.title
      automaticallyImplyMiddle: true,
      // 当 leading 为空，且 automaticallyImplyLeading == true，会出现在默认返回箭头右边的文字
      previousPageTitle: 'Back',
      middle: const Text('CupertinoPageScaffold'),
      // 右侧组件
      trailing: GestureDetector(
        child: const Icon(Icons.add),
        onTap: () {
          print('trailing click');
        },
      ),
      border: const Border(bottom: BorderSide(color: Colors.red, width: 3.0)),
      // 背景色
      backgroundColor: Colors.blue.shade100,
      // 上方电量，事件，Wifi 等状态栏颜色
      brightness: Brightness.light,
      // 内边距，用来调节所有子组件上下左右偏移
      padding:
          const EdgeInsetsDirectional.only(start: 15.0, bottom: 0.0, end: 15.0),
    );
  }
}
