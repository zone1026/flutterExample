// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// CupertinoNavigationBar 是 Flutter 提供的 iOS 风格的 NavigationBar。
class YZCupertinoNavigationBarWidget extends StatelessWidget {
  const YZCupertinoNavigationBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: _cupertinoNavigationBar(context),
        child: SafeArea(
            child: Center(
          child: Container(
            // width: 100.0,
            height: 100.0,
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text(
              'CupertinoNavigationBar',
              style: TextStyle(
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  color: Colors.white),
            ),
          ),
        )));
  }

  CupertinoNavigationBar _cupertinoNavigationBar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: TextButton(
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // 是否添加默认 leading，默认为 true。当 leading 为空会默认添加一个返回按钮
      automaticallyImplyLeading: true,
      // 是否添加默认 middle，默认为 true，如果 middle 为空，且当前 route 为 CupertinoPageRoute，会默认填充 route.title
      automaticallyImplyMiddle: true,
      // 当 leading 为空，且 automaticallyImplyLeading == true，会出现在默认返回箭头右边的文字
      previousPageTitle: 'Back',
      middle: const Text('CupertinoNavigationBar'),
      trailing: TextButton(
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          print('CupertinoNavigationBar trailing click');
        },
      ),
      border: const Border(bottom: BorderSide(color: Colors.red, width: 1.0)),
      backgroundColor: Colors.yellow,
      brightness: Brightness.light,
      padding:
          const EdgeInsetsDirectional.only(start: 15.0, bottom: 0.0, end: 15.0),
    );
  }
}
