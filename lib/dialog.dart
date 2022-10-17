// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YZDialogWidget extends StatefulWidget {
  const YZDialogWidget({Key? key}) : super(key: key);
  @override
  YZDialogWidgetState createState() => YZDialogWidgetState();
}

class YZDialogWidgetState extends State<YZDialogWidget> {
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
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Text(
          "Dialog",
        ),
      ),
      body: ListView(
        children: [
          _dialogButton(context, 'SimpleDialog', _simpleDialog()),
          _dialogButton(context, 'AlertDialog', _alertDialog()),
          _dialogButton(
              context, 'CupertinoAlertDialog', _cupertinoAlertDialog()),
          _cupertinoButton(
              context, 'CupertinoAlertDialog', _cupertinoAlertDialog()),
          _dialogButton(context, 'Custom Dialog', _customDialog()),
        ],
      ),
    );
  }

  late BuildContext dialogContext;

  ElevatedButton _dialogButton(
      BuildContext context, String title, Widget dialog) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.orange)),
      // 设置异步回调
      onPressed: () async {
        var relust = await showDialog(
          context: context,
          builder: (context) {
            // 记录弹框BuildContext，在隐藏dialog时使用
            dialogContext = context;
            return dialog;
          },
          // 点击弹框之外的蒙层区域是否可以Dismiss，默认为true
          barrierDismissible: true,
          // 蒙层颜色
          barrierColor: Colors.red.withAlpha(100),
          barrierLabel: 'barrier',
          useSafeArea: true,
          useRootNavigator: true,
          // 锚点
          anchorPoint: const Offset(64.0, 64.0),
        );
        print(relust);
      },
      child: Text(title),
    );
  }

  SimpleDialog _simpleDialog() {
    return SimpleDialog(
      // 标题
      title: const Text('Simple Dialog'),
      // 标题外间距
      titlePadding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
      // 标题样式 TextStyle
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25.0),
      // 内容外间距
      contentPadding: const EdgeInsets.all(15.0),
      backgroundColor: Colors.red,
      // 阴影高度
      // elevation: 12.0,
      // shape: ,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.cyan, width: 2.0),
          borderRadius: BorderRadius.circular(30.0)),
      // 子控件
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30.0),
          child: const Text(
            '这就是最简单的 Dialog 了, 也可以在这里自定义样式。',
            style: TextStyle(fontSize: 20.0, color: Colors.green),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {});
            // 隐藏弹框
            Navigator.pop(dialogContext, {"data": 'simple dialog data'});
          },
          child: const Text("我知道了"),
        ),
      ],
    );
  }

  AlertDialog _alertDialog() {
    return AlertDialog(
      // 标题
      title: const Text('Alert Dialog'),
      // 标题外间距
      titlePadding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
      // 标题样式 TextStyle
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25.0),
      // 内容外间距
      contentPadding: const EdgeInsets.all(15.0),
      content: SizedBox(
        height: 100.0,
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Text("这是最简单的 AlertDialog，也可以自定义样式"),
          ],
        ),
      ),
      contentTextStyle: const TextStyle(color: Colors.green, fontSize: 20.0),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.red),
            textStyle: MaterialStateProperty.resolveWith(
                (states) => const TextStyle(fontSize: 25.0)),
            shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.orange, width: 5.0),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          onPressed: () {
            setState(() {});
            // 隐藏弹框
            Navigator.pop(dialogContext, {"data": 'cancel data'});
          },
          child: const Text("cancel"),
        ),
        // const Text("也可以不放按钮的"),
        ElevatedButton(
          onPressed: () {
            setState(() {});
            // 隐藏弹框
            Navigator.pop(dialogContext, {"data": 'sure data'});
          },
          child: const Text("sure"),
        ),
      ],
      backgroundColor: Colors.red,
      // 阴影高度
      // elevation: 12.0,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.cyan, width: 2.0),
          borderRadius: BorderRadius.circular(60.0)),
    );
  }

  ElevatedButton _cupertinoButton(
      BuildContext context, String title, Widget dialog) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.blue)),
      // 设置异步回调
      onPressed: () async {
        var relust = await showCupertinoDialog(
          context: context,
          builder: (context) {
            // 记录弹框BuildContext，在隐藏dialog时使用
            dialogContext = context;
            return dialog;
          },
          // 点击弹框之外的蒙层区域是否可以Dismiss，默认为false
          barrierDismissible: true,
          useRootNavigator: true,
          // 锚点
          // anchorPoint: const Offset(64.0, 64.0),
        );
        print(relust);
      },
      child: Text(title),
    );
  }

  CupertinoAlertDialog _cupertinoAlertDialog() {
    return CupertinoAlertDialog(
      title: const Text('CupertinoAlertDialog'),
      content: SizedBox(
        // height: 300.0,
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(15),
            ),
            Text("这是最简单的 CupertinoAlertDialog，也可以自定义样式"),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {});
            // 隐藏弹框
            Navigator.pop(dialogContext, {"data": 'cancel data'});
          },
          child: const Text(
            "cancel",
            style: TextStyle(color: Colors.black),
          ),
        ),
        // const Text("也可以不放按钮的"),
        TextButton(
          onPressed: () {
            setState(() {});
            // 隐藏弹框
            Navigator.pop(dialogContext, {"data": 'sure data'});
          },
          child: const Text(
            "delete",
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {});
            // 隐藏弹框
            Navigator.pop(dialogContext, {"data": 'sure data'});
          },
          child: const Text(
            "sure",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Dialog _customDialog() {
    return Dialog(
      // 背景色
      backgroundColor: Colors.red,
      // 阴影高度
      elevation: 40.0,
      // 动画时间
      insetAnimationDuration: const Duration(milliseconds: 3000),
      // 动画效果
      insetAnimationCurve: Curves.easeInOut,
      // 弹框距离屏幕边缘距离
      insetPadding: const EdgeInsets.all(15.0),
      // 剪切方式
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          // side: const BorderSide(color: Colors.orange, width: 2.0),
          borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: 300.0,
        height: 200.0,
        // color: Colors.red,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(15)),
            const Text(
              "Custom Dialog",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            const Text("这是一个最简单的自定义 Custom Dialog"),
            const Padding(
              padding: EdgeInsets.all(15.0),
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white)),
              onPressed: () {
                // 隐藏弹框
                Navigator.pop(dialogContext, {"data": 'sure data'});
              },
              child: const Text("我知道了",
                  style: TextStyle(
                      color: Colors.red, fontStyle: FontStyle.italic)),
            ),
          ],
        ),
      ),
    );
  }
}
