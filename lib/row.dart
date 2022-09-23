import 'package:flutter/material.dart';

class YZRowVc extends StatelessWidget {
  const YZRowVc({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text(
            "Row",
          )),
      body: Container(
        height: 200.0,
        margin: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
        // color: Colors.cyan,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: _row(),
      ),
    );
  }

  Row _row() {
    return Row(
      // 主轴（行 or 水平方向）对其方式
      mainAxisAlignment: MainAxisAlignment.start,
      // 交叉方向上（列 or 垂直方向）对其方式
      crossAxisAlignment: CrossAxisAlignment.baseline,
      // TODO: CrossAxisAlignment.baseline 不可以单独使用，需要配合 textBaseline 使用
      // baseline 属性是作用于文本的，需要在每个 Item 里均加入一个 Text 文本
      textBaseline: TextBaseline.alphabetic,
      // 子视图
      children: [
        Container(
          color: Colors.red,
          width: 60.0,
          height: 36.0,
          child: const Text(
            "red",
            style: TextStyle(fontSize: 10.0),
          ),
        ),
        Container(
          color: Colors.green,
          width: 90.0,
          height: 36.0,
          child: const Text(
            "green",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Container(
          color: Colors.blue,
          width: 80.0,
          height: 36.0,
          child: const Text(
            "blue",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ],
    );
  }
}
