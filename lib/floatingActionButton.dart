// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZFloatingActionButtonWidget extends StatelessWidget {
  const YZFloatingActionButtonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Text(
          "FloatingActionButton",
        ),
      ),
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: _bottomAppBar(),
      body: Container(),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      // Button背景色
      backgroundColor: Colors.red,
      // Icon 与 Text 颜色
      foregroundColor: Colors.green,
      // 点击时的颜色
      splashColor: Colors.black,
      // 自定义形状
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(width: 2.0, color: Colors.green),
      ),
      onPressed: () {
        print('floatingActionButton click');
      },
      // 长按时显示的提示语
      tooltip: '长按时显示的提示语',
      child: const Icon(
        Icons.favorite,
        // color: Colors.white,
      ),
    );
/**
    return FloatingActionButton.extended(
      backgroundColor: Colors.red,
      onPressed: () {
        print('floatingActionButton click');
      },
      icon: const Icon(
        Icons.favorite,
        color: Colors.white,
      ),
      label: const Text(
        '悬浮按钮',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
     */
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      // NotchedShape 类型，可以用来做不接触的效果
      shape: const CircularNotchedRectangle(),
      // BottomAppBar 的阴影高度，默认为 8.0
      elevation: 20.0,
      // 不接触效果的间隔距离
      notchMargin: 10.0,
      child: SizedBox(
        height: 50.0,
        child: Row(children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text('底'),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text('部'),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text('按'),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text('钮'),
            ),
          ),
        ]),
      ),
    );
  }
}
