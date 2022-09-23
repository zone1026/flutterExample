import 'package:flutter/material.dart';

class YZColumnVc extends StatelessWidget {
  const YZColumnVc({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Column",
          )),
      body: Container(
        width: 200.0,
        height: 500.0,
        margin: const EdgeInsets.only(top: 15.0, left: 15.0),
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(width: 3.0),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: _column(),
      ),
    );
  }

  Column _column() {
    return Column(
      // 主轴（列 or 垂直方向）对其方式
      mainAxisAlignment: MainAxisAlignment.start,
      // 交叉方向上（行 or 水平方向）对其方式
      crossAxisAlignment: CrossAxisAlignment.start,
      // textBaseline: TextBaseline.alphabetic,
      // 子视图
      children: [
        Container(
          color: Colors.red[300],
          width: 60.0,
          height: 36.0,
          // child: const Text(
          //   "red",
          //   style: TextStyle(fontSize: 10.0),
          // ),
        ),
        Container(
          color: Colors.green,
          width: 90.0,
          height: 36.0,
          // child: const Text(
          //   "green",
          //   style: TextStyle(fontSize: 20.0),
          // ),
        ),
        Container(
          color: Colors.blue,
          width: 80.0,
          height: 36.0,
          // child: const Text(
          //   "blue",
          //   style: TextStyle(fontSize: 30.0),
          // ),
        ),
      ],
    );
  }
}
