import 'package:flutter/material.dart';

/// InputDecoration 主要为 TextField 提供各种样式排版布局
class YZInputDecorationWidget extends StatefulWidget {
  const YZInputDecorationWidget({Key? key}) : super(key: key);
  @override
  YZInputDecorationWidgetState createState() => YZInputDecorationWidgetState();
}

class YZInputDecorationWidgetState extends State<YZInputDecorationWidget> {
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
        // backgroundColor: Colors.cyan,
        title: const Text("InputDecoration"),
      ),
      body: SafeArea(
        child: _listView(),
      ),
    );
  }

  ListView _listView() {
    return ListView(
      padding: const EdgeInsets.all(15.0),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [_textField()],
    );
  }

  TextField _textField() {
    return TextField(
      cursorColor: Colors.red,
      decoration: _decoration(),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      // 是否填充
      filled: true,
      // 填充色
      fillColor: Colors.yellow.shade300,

      // 错误文本，位于输入框左下方
      // errorText: 'error text',
      errorStyle: const TextStyle(color: Colors.red, fontSize: 25.0),
      errorMaxLines: 2,

      // 辅助文本，位于输入框下方，errorText 为空时显示
      helperText: 'helper text',
      helperMaxLines: 2,
      helperStyle: const TextStyle(color: Colors.green, fontSize: 15.0),

      // 提示语，位于输入框左上方
      labelText: 'label text',
      labelStyle: const TextStyle(color: Colors.blue, fontSize: 18.0),

      // 尾部文本，位于输入框右侧，与 suffix 不能同时使用
      suffixText: 'suffix text',
      suffixStyle: const TextStyle(color: Colors.orange, fontSize: 16.0),

      // 备注文本，位于输入框右下角外侧，与 counter 不能同时使用
      counterText: 'counter text',
      counterStyle: const TextStyle(color: Colors.pink, fontSize: 12.0),

      // 占位文本，位于输入框光标后，输入内容为空时展示
      hintText: 'hint text',
      hintMaxLines: 2,
      hintStyle: const TextStyle(color: Colors.black, fontSize: 14.0),

      // 头部文本，位于光标左侧，与 prefix 不能同时使用
      prefixText: 'prefix text',
      prefixStyle: const TextStyle(color: Colors.red, fontSize: 14.0),
      prefixIcon: const Icon(Icons.phone, color: Colors.orange),

      // 语义标签
      semanticCounterText: 'semantic counter text',

      // contentPadding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),

      // labelText 显示在输入框中，当开始输入时，会有一个动画，字体变小并显示在输入框上方
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    );
  }
}
