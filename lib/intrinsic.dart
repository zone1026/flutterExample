// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZIntrinsicWidget extends StatelessWidget {
  const YZIntrinsicWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Intrinsic Width & Height',
        ),
      ),
      body: Container(
        color: Colors.red,
        margin: const EdgeInsets.only(top: 15.0),
        child: const UnconstrainedBox(
          child: LimitedBox(
            maxWidth: 100.0,
            maxHeight: 100.0,
            child: Text(
                'data data data data data data data data data data data data'),
          ),
        ),
      ),
    );
  }
}

IntrinsicWidth _width() {
  return IntrinsicWidth(
    stepWidth: 100.0,
    stepHeight: 11.0,
    child: _container(),
  );
}

Container _container() {
  return Container(
    color: Colors.red,
    child: Center(
      child: Container(
        color: Colors.cyan,
        width: 50.0,
        height: 50.0,
      ),
    ),
  );
}

/// 将子控件的高度调整至实际高度
IntrinsicHeight _height() {
  return IntrinsicHeight(
    child: _row(),
  );
}

Row _row() {
  return Row(
    children: [
      Container(
        width: 50.0,
        color: Colors.red,
      ),
      Container(
        margin: const EdgeInsets.only(left: 15.0),
        width: 28.0,
        height: 50.0,
        color: Colors.green,
      ),
      Container(
        margin: const EdgeInsets.only(left: 15.0),
        width: 50.0,
        height: 50.0,
        color: Colors.blue,
      ),
    ],
  );
}
