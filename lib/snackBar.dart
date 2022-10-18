// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 底部消息弹框
class YZSnackBarWidget extends StatelessWidget {
  const YZSnackBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SnackBar",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: const [YZNormalSnackBarWidget()],
      ),
    );
  }
}

class YZNormalSnackBarWidget extends StatelessWidget {
  const YZNormalSnackBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 先 隐藏SnackBar
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        // 显示SnackBar
        ScaffoldMessenger.of(context).showSnackBar(_snackBar());
      },
      child: const Text('Normal SnackBar'),
    );
  }

  SnackBar _snackBar() {
    return SnackBar(
      // 左侧内容 Widget
      content: PhysicalModel(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          // width: 88.0,
          height: 88.0,
          color: Colors.white,
          child: Row(
            children: [
              const Padding(padding: EdgeInsets.all(4.0)),
              Container(
                width: 64.0,
                height: 64.0,
                color: Colors.blue,
                child: Image.network(
                    'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'),
              ),
              const Padding(padding: EdgeInsets.all(4.0)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'title',
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    'subtitle',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.red,
      elevation: 12.0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.yellow, width: 2.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      // SnackBarBehavior.fixed 是贴合屏幕边框的，SnackBarBehavior.floating 是悬浮出来的一个弹框
      behavior: SnackBarBehavior.floating,
      // SnackBarAction，右侧事件按钮
      action: _action(),
      // 弹框展示时长，默认为 Duration(milliseconds: 4000)
      // 1 seconds = 1000 milliseconds
      duration: const Duration(milliseconds: 5000),
      // SnackBar 展示在屏幕上时的回调函数
      onVisible: () {
        print('snack did visible');
      },
    );
  }

  SnackBarAction _action() {
    return SnackBarAction(
      label: 'snackBarAction',
      onPressed: () {
        print('snackBarAction click');
      },
      textColor: Colors.orange,
      disabledTextColor: Colors.grey,
    );
  }
}
