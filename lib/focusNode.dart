// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';

/// FocusNode 主要就是用来控制焦点
class YZFocusNodeWidget extends StatefulWidget {
  const YZFocusNodeWidget({Key? key}) : super(key: key);
  @override
  _YZFocusNodeWidgetState createState() => _YZFocusNodeWidgetState();
}

class _YZFocusNodeWidgetState extends State<YZFocusNodeWidget> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Focus Node"),
      ),
      body: SafeArea(
        // child: _textField(),
        child: _focusScope(),
      ),
    );
  }

  TextField _textField() {
    FocusNode focusNode = FocusNode();
    return TextField(
      focusNode: focusNode,
      onSubmitted: (value) {
        print(value);
        // FocusManager.instance.primaryFocus?.unfocus();
        focusNode.unfocus();
      },
    );
  }

  // FocusScopeNode 来对焦点进行管理,实现输入框自动下跳
  final FocusScopeNode _scopeNode = FocusScopeNode();

  FocusScope _focusScope() {
    return FocusScope(
      node: _scopeNode,
      child: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          _normalField(),
          _normalField(),
          _btnField(),
          _normalField(),
          _normalField(),
          _btnField(),
          _normalField()
        ],
      ),
    );
  }

  TextField _normalField() {
    return TextField(
      decoration: const InputDecoration(hintText: '请输入文本'),
      onEditingComplete: () {
        _scopeNode.nextFocus();
        // _scopeNode.unfocus();
      },
    );
  }

  Row _btnField() {
    return Row(
      children: [
        Expanded(child: _normalField()),
        ElevatedButton(
          // 自动跳过ElevatedButton焦点的捕获
          focusNode: FocusNode(skipTraversal: true),
          onPressed: () {
            print('click me');
          },
          child: const Text('我可以点的'),
        )
      ],
    );
  }
}
