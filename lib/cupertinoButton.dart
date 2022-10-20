import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Flutter 中各个风格的 button 使用方法基本一致，只是会带一些默认属性而已。
class YZCupertinoButtonWidget extends StatelessWidget {
  const YZCupertinoButtonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(
    //       'CupertinoButton',
    //     ),
    //   ),
    //   body: Container(),
    // );
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoButton'),
        // backgroundColor: Colors.yellow,
      ),
      child: SafeArea(
        child: _column(),
      ),
    );
  }

  Column _column() {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(15.0)),
        Container(
          width: 210.0,
          alignment: Alignment.center,
          child: _cupertinoButton(),
        ),
        const Padding(padding: EdgeInsets.all(15.0)),
        Container(
          alignment: Alignment.center,
          child: _disableButton(),
        ),
      ],
    );
  }

  CupertinoButton _cupertinoButton() {
    return CupertinoButton(
      color: Colors.red,
      padding: const EdgeInsets.all(20.0),
      disabledColor: Colors.green,
      alignment: Alignment.centerLeft,
      borderRadius: BorderRadius.circular(35.0),
      // 按压下去时 button 透明度，默认为 0.4
      pressedOpacity: 0.9,
      onPressed: () {
        print('onPressed');
      },
      child: Row(children: const [
        Icon(
          Icons.radio_button_checked,
          color: Colors.white,
        ),
        Padding(padding: EdgeInsets.all(5.0)),
        Text(
          'CupertinoButton',
          style: TextStyle(color: Colors.white),
        ),
      ]),
    );
  }

  CupertinoButton _disableButton() {
    return CupertinoButton(
      // disable时不起作用
      color: Colors.yellow,
      disabledColor: Colors.green,
      padding: const EdgeInsets.all(15.0),
      borderRadius: BorderRadius.circular(15.0),
      onPressed: null,
      child: const Text('DisableButton'),
    );
  }
}
