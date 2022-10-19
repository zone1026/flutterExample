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
            _chip(),
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            _actionChip(),
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            _choiceChip(),
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            _filterChip(),
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

  // 可点击的chip
  // 相比 Chip，ActionChip 增加了 onPressed 的点击事件，同时 ActionChip 移除了 deleteIcon 等相关属性。
  ActionChip _actionChip() {
    return ActionChip(
      // 左侧图标组件
      avatar: _circleAvatar(),
      label: const Text('Action Chip'),
      // 文本样式
      labelStyle: const TextStyle(fontSize: 18.0, color: Colors.green),
      // 文本外边距 Padding
      labelPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      onPressed: () {
        print('click action chip');
      },
      // Chip 形状
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(width: 2.0, color: Colors.red),
      ),
      elevation: 10.0,
      shadowColor: Colors.yellow,
    );
  }

  bool _choiceSelected = true;
  ChoiceChip _choiceChip() {
    return ChoiceChip(
      avatar: _circleAvatar(),
      label: const Text('Choice Chip'),
      // 文本样式
      labelStyle: const TextStyle(fontSize: 18.0, color: Colors.green),
      // 文本外边距 Padding
      labelPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),

      // disabledColor: Colors.green,
      // 背景颜色，可以作为非选中时的颜色展示
      backgroundColor: Colors.yellow,
      selected: _choiceSelected,
      selectedColor: Colors.red,
      onSelected: (value) {
        _choiceSelected = value;
        setState(() {});
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: const BorderSide(width: 2.0, color: Colors.yellow),
      ),
    );
  }

  bool _filterChipSelected = false;
  FilterChip _filterChip() {
    return FilterChip(
      avatar: _circleAvatar(),
      label: const Text('Filter Chip'),
      // 文本样式
      labelStyle: const TextStyle(fontSize: 18.0, color: Colors.green),
      // 文本外边距 Padding
      labelPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),

      // 背景颜色，可以作为非选中时的颜色展示
      backgroundColor: Colors.yellow,
      selected: _filterChipSelected,
      selectedColor: Colors.red,
      onSelected: (value) {
        _filterChipSelected = value;
        setState(() {});
      },
      // 是否显示勾选框
      showCheckmark: true,
      checkmarkColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(
          color: (_filterChipSelected ? Colors.yellow : Colors.red),
          width: 3.0,
        ),
      ),
      shadowColor: Colors.red,
      selectedShadowColor: Colors.yellow,
      elevation: 10.0,
    );
  }
}
