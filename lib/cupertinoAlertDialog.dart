import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

/// CupertinoAlertDialog 是 iOS 中常用的 Alert 控件，等同于 UIAlertController，
/// 同理 CupertinoDialogAction 是 Alert 的交互事件，等同于 UIAlertAction。
class YZCupertinoAlertDialogWidget extends StatefulWidget {
  const YZCupertinoAlertDialogWidget({Key? key}) : super(key: key);
  @override
  YZCupertinoAlertDialogWidgetState createState() =>
      YZCupertinoAlertDialogWidgetState();
}

class YZCupertinoAlertDialogWidgetState
    extends State<YZCupertinoAlertDialogWidget> {
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
    return CupertinoPageScaffold(
      navigationBar:
          const CupertinoNavigationBar(middle: Text('CupertinoAlertDialog')),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            CupertinoButton(
              color: Colors.red,
              child: const Text('Normal CupertinoAlertDialog'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _cupertinoAlertDialogForNormal(context);
                    });
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 32.0)),
            CupertinoButton(
              color: Colors.red,
              child: const Text('Custom CupertinoAlertDialog'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _cupertinoAlertDialogForCustom(context);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  CupertinoAlertDialog _cupertinoAlertDialogForNormal(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text(
        'Alert Title',
        style: TextStyle(color: Colors.red),
      ),
      content: const Text('Alert Content'),
      actions: [
        CupertinoDialogAction(
          // 是否为默认事件，为 true 时会加粗
          isDefaultAction: false,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Sure',
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ),
        CupertinoDialogAction(
          // 是否为默认事件，为 true 时会加粗
          isDefaultAction: false,
          // 是否为警告按钮，为 true 时会变成红色
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        )
      ],
    );
  }

  CupertinoAlertDialog _cupertinoAlertDialogForCustom(BuildContext context) {
    return CupertinoAlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.add_alert),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Text('Alert'),
        ],
      ),
      content: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.red,
            child: Image.network(Constants.imageUlr),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          const Text(
            '这是一个图文弹框。',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          textStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Icon(Icons.laptop_chromebook),
              Text(
                '我知道了',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          // 是否为默认事件，为 true 时会加粗
          isDefaultAction: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.laptop_chromebook),
              Text(
                'Sure',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          // 是否为警告按钮，为 true 时会变成红色
          isDestructiveAction: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.cancel),
              Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
