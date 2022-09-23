import 'package:flutter/material.dart';

/**
 * 图标
 */
class YZIconWidget extends StatelessWidget {
  const YZIconWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Text(
          "Icon",
        ),
      ),
      body: Container(
        child: _column(),
      ),
    );
  }

  Column _column() {
    return Column(
      children: const [
        Icon(
          Icons.read_more,
          size: 40.0,
          color: Colors.red,
        ),
        Icon(
          Icons.get_app,
          size: 40.0,
          color: Colors.green,
        ),
        Icon(
          Icons.bubble_chart,
          size: 40.0,
          color: Colors.blue,
        ),
        Icon(
          Icons.yard,
        ),
        Icon(
          Icons.zoom_in,
          color: Colors.cyan,
          semanticLabel: 'icon',
        ),
      ],
    );
  }
}
