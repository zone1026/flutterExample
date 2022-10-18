// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// 标签控件
class YZChipWidget extends StatefulWidget {
  const YZChipWidget({Key? key}) : super(key: key);
  @override
  YZChipWidgetState createState() => YZChipWidgetState();
}

class YZChipWidgetState extends State<YZChipWidget> {
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
        // backgroundColor: Colors.cyan,
        title: const Text("Chip"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            _chipForSimpleText(),
            _chipForSimple(),
            _chipForNormal(),
            _chip()
          ],
        ),
      ),
    );
  }

  Chip _chipForSimpleText() {
    return const Chip(label: Text('Simple Text Chip'));
  }

  Chip _chipForSimple() {
    return const Chip(
      label: Text('Simple Chip'),
      avatar: CircleAvatar(
        backgroundColor: Colors.red,
      ),
    );
  }

  Chip _chipForNormal() {
    return Chip(
      label: const Text('Normal Chip'),
      avatar: const CircleAvatar(
        backgroundColor: Colors.blue,
      ),
      deleteIcon: const Icon(
        Icons.close,
        color: Colors.red,
      ),
      onDeleted: () {
        print('deleted click');
      },
    );
  }

  Chip _chip() {
    return Chip(
      // 左侧图标组件
      avatar: _circleAvatar(),
      // 文本 Widget
      label: const Text('Chip'),
      // 文本样式
      labelStyle: const TextStyle(color: Colors.red, fontSize: 18.0),
      // 文本外边距 Padding
      labelPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
      // 右侧删除按钮 Widget
      deleteIcon: const Icon(Icons.close),
      // 长按删除按钮的提示语
      deleteButtonTooltipMessage: 'deleteButtonTooltipMessage',
      // 删除按钮颜色
      deleteIconColor: Colors.red,
      // 删除按钮点击事件
      onDeleted: () {
        print('click delete');
      },
      // 形状，ShapeBorder
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(width: 2.0, color: Colors.yellow),
      ),
      // 阴影颜色
      shadowColor: Colors.red,
      // 阴影高度，默认为 0
      elevation: 10.0,
    );
  }

  CircleAvatar _circleAvatar() {
    return CircleAvatar(
      // 背景色
      backgroundColor: Colors.red,
      // 前景颜色
      foregroundColor: Colors.black,
      // 背景图
      backgroundImage: const NetworkImage(
          'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'),
      // 背景图加载失败回调
      onBackgroundImageError: (exception, stackTrace) {
        print('onBackgroundImageError');
      },
      // 半径 (和 maxRadius 以及 minRadius 不能同时存在)
      // radius: 30.0,
      // 最大半径 (和 radius 不能同时存在)
      maxRadius: 60.0,
      // 最小半径 (和 radius 不能同时存在)
      minRadius: 50.0,
      // 子控件 Widget
      child: Container(
        width: 30.0,
        height: 30.0,
        color: Colors.green,
        alignment: Alignment.center,
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
