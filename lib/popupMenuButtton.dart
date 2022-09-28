// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZPopupMenuButtonWidget extends StatelessWidget {
  const YZPopupMenuButtonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PopupMenuButton",
        ),
        // actions: [_popupMenuButton()],
        actions: [
          GestureDetector(
            onTap: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(300.0, 105.0, 15.0, 0.0),
                items: _menuItems(),
              );
            },
            child: const Icon(Icons.menu),
          )
        ],
      ),
      body: Container(),
    );
  }

  PopupMenuButton _popupMenuButton() {
    return PopupMenuButton(
      color: Colors.yellow,
      tooltip: '长按PopupMenuButton时的提示文本',
      // PopupMenuButton阴影距离
      elevation: 20.0,
      // PopupMenuButton是否可点击,默认为 true,
      enabled: true,
      onSelected: (dynamic value) {
        print(value);
      },
      onCanceled: () {
        print('popup menu button close');
      },
      itemBuilder: (BuildContext context) {
        return const [
          PopupMenuItem(
            // 点击时带入到点击事件的值
            value: 'one',
            textStyle: TextStyle(color: Colors.cyan),
            child: Text('menu_1'),
          ),
          PopupMenuItem(
            value: 'two',
            // 是否可以点击，默认为 true
            enabled: false,
            child: Text('menu_2'),
          ),
          PopupMenuItem(
            value: 'three',
            // 高度，默认为 kMinInteractiveDimension
            height: 64.0,
            child: Text('menu_3'),
          ),
        ];
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(
            color: Colors.red, width: 2.0, style: BorderStyle.solid),
      ),
      // icon 与 child 属性不能同时设置，否则会报错
      // icon: const Icon(Icons.menu),
      child: const Center(
        child: Text('menu'),
      ),
    );
  }

  List<PopupMenuItem> _menuItems() {
    return const [
      PopupMenuItem(
        // 点击时带入到点击事件的值
        value: 'one',
        textStyle: TextStyle(color: Colors.cyan),
        child: Text('menu_1'),
      ),
      PopupMenuItem(
        value: 'two',
        // 是否可以点击，默认为 true
        enabled: false,
        child: Text('menu_2'),
      ),
      PopupMenuItem(
        value: 'three',
        // 高度，默认为 kMinInteractiveDimension
        height: 64.0,
        child: Text('menu_3'),
      ),
    ];
  }
}
