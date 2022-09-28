import 'package:flutter/material.dart';

class YZButtonBarWidget extends StatelessWidget {
  const YZButtonBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ButtonBar",
        ),
      ),
      body: Container(
        child: _buttonBar(),
      ),
    );
  }

  // ButtonBar 只是一个容器而已，为子控件 button 提供一些共有主题之类的
  ButtonBar _buttonBar() {
    // 当 ButtonBar.childred 可以在一行排列完成时，可以理解为 Row，
    // 反之当 ButtonBar.children 无法在一行里排列下时，他会纵向排列，也就变成了 Column。
    return ButtonBar(
      // MainAxisAlignment，主轴布局方式
      alignment: MainAxisAlignment.spaceBetween,
      // 设置最小宽度
      // 当 ButtonBar.children 的宽度不足最小宽度时，会改变子控件宽度与设置的最小宽度相等。
      // buttonMinWidth: 200.0,
      // buttonHeight: 100.0,
      // Button间隔距离
      overflowButtonSpacing: 20.0,
      // Button内边距
      buttonPadding: const EdgeInsets.all(20),
      // ButtonBar.children中Button排列顺序，默认为 VerticalDirection.down，顺向
      overflowDirection: VerticalDirection.down,
      // 子控件集合，建议设置为Button集合
      children: [
        _elevatedButton(),
        _textButton(),
        _elevatedButton(),
        _textButton(),
      ],
    );
  }

  ElevatedButton _elevatedButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.favorite),
      label: const Text('ElevatedButton'),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.red),
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
      ),
    );
  }

  TextButton _textButton() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.home),
      label: const Text('TextButton'),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.red),
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.black),
      ),
    );
  }
}
