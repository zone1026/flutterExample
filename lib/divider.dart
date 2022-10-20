import 'package:flutter/material.dart';

class YZDividerWidget extends StatelessWidget {
  const YZDividerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Title',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15.0, 44.0, 15.0, 24.0),
        children: [
          Container(
            height: 50.0,
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text('高度为 30，线宽为 5 的分割线'),
          ),
          const Divider(
            // Divider 组件高度
            height: 50.0,
            // 分割线线宽，分割线居于 Divider 中心
            thickness: 5.0,
            // 分割线左侧间距
            indent: 20.0,
            // 分割线右侧间距
            endIndent: 15.0,
            // 分割线颜色
            color: Colors.green,
          ),
          Container(
            height: 50.0,
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text('高度为 0，线宽为 5 的分割线'),
          ),
          const Divider(
            // Divider 组件高度
            height: 0.0,
            // 分割线线宽，分割线居于 Divider 中心
            thickness: 5.0,
            // 分割线左侧间距
            indent: 20.0,
            // 分割线右侧间距
            endIndent: 15.0,
            // 分割线颜色
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
