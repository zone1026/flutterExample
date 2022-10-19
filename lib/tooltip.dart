import 'package:flutter/material.dart';

/// 用 Tooltip 包裹的控件，长按可以弹出 Tooltip 提示的 message
class YZTooltipWidget extends StatelessWidget {
  const YZTooltipWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tooltip",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          _tooltip(),
          const Padding(padding: EdgeInsets.all(15.0)),
          _imageTooltip()
        ],
      ),
    );
  }

  Tooltip _tooltip() {
    return Tooltip(
      message: '在 iOS 中，你在 UI 中创建的大部分视图都是 UIView 的实例。而在构造布局时，这些视图也可以作为其他视图的容器。',
      // richMessage: ,
      // 不设置 child 时，Tooltip 的固有高度
      height: 30.0,
      // ToolTip 内边距
      padding: const EdgeInsets.all(15.0),
      // ToolTip 外边距
      margin: const EdgeInsets.all(15.0),
      // 距离 child 中心点的竖直方向偏移量
      verticalOffset: 88.0,
      // 有足够空间时，设置为 false 时，会展示在 child 上方
      preferBelow: true,
      // 是否使用语义标签
      excludeFromSemantics: false,
      // 指针悬停多久后展示 Tooltip ，默认为 0
      waitDuration: const Duration(seconds: 1),
      // 展示时长，之后消失
      showDuration: const Duration(seconds: 10),
      textStyle: const TextStyle(color: Colors.cyan),
      // 装饰
      decoration: _decoration(),
      // 子控件
      child: const Text(
        'iOS',
        textAlign: TextAlign.center,
      ),
    );
  }

  Tooltip _imageTooltip() {
    return Tooltip(
      message: '在 iOS 中',
      // richMessage: ,
      // 不设置 child 时，Tooltip 的固有高度
      height: 30.0,
      // ToolTip 内边距
      padding: const EdgeInsets.all(15.0),
      // ToolTip 外边距
      margin: const EdgeInsets.all(15.0),
      // 距离 child 中心点的竖直方向偏移量
      verticalOffset: 50.0,
      // 有足够空间时，设置为 false 时，会展示在 child 上方
      preferBelow: true,
      // 是否使用语义标签
      excludeFromSemantics: false,
      // 指针悬停多久后展示 Tooltip ，默认为 0
      waitDuration: const Duration(seconds: 1),
      // 展示时长，之后消失
      showDuration: const Duration(seconds: 10),
      textStyle: const TextStyle(color: Colors.cyan),
      // 装饰
      decoration: BoxDecoration(color: Colors.red.shade100),
      // 子控件
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: _column(),
      ),
    );
  }

  Column _column() {
    return Column(
      children: [
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Image.network(
              'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'),
        ),
        const Text('iOS'),
      ],
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      // 边框
      border: Border.all(color: Colors.red, width: 3.0),
      // 边框角
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      // 背景图
      image: const DecorationImage(
        image: NetworkImage(
            'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'),
      ),
      // 阴影
      boxShadow: [
        BoxShadow(color: Colors.red.shade200, offset: const Offset(5.0, 5.0))
      ],
      // 渐变色
      gradient: const LinearGradient(
          colors: [Colors.white, Colors.red],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0)),
    );
  }
}
