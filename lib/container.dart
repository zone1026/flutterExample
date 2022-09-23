import 'package:flutter/material.dart';

class YZContainerVc extends StatelessWidget {
  const YZContainerVc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Container",
          )),
      body: _body(),
    );
  }

  Transform _body() {
    return Transform(
      transform: Matrix4.rotationZ(0.1),
      child: Container(
        constraints: const BoxConstraints.expand(width: 200.0, height: 160.0),
        // color: Colors.red,
        // 此时优先执行约束，会挤压宽度小于 200
        margin: const EdgeInsets.only(top: 15.0, left: 15.0),
        // TODO: decoration 属性和 color 属性不可以同时使用
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 3.0,
          ),
          // 圆角
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2.0),
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
              topRight: Radius.circular(2.0)),
          // 渐变层
          gradient: const LinearGradient(
              colors: [Colors.cyan, Colors.blue],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0)),
          // 图片
          image: const DecorationImage(
              alignment: Alignment.center,
              image: NetworkImage(
                  "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"),
              fit: BoxFit.contain),
          // 阴影
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(10.0, 10.0))
          ],
        ),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 8.0),
        child: const Text(
          "data",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
