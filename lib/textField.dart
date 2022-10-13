// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// TextField 是 flutter 输入框组件，组件功能强大
class YZTextFieldWidget extends StatefulWidget {
  const YZTextFieldWidget({Key? key}) : super(key: key);
  @override
  YZTextFieldWidgetState createState() => YZTextFieldWidgetState();
}

class YZTextFieldWidgetState extends State<YZTextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("TextField"),
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
      // 控制器，可以控制 textField 的输入内容，也可以监听 textField 改变
      controller: _controller(),
      // textField 装饰
      decoration: _normalDecoration(),
      // 输入框完成按钮的样式
      textInputAction: TextInputAction.search,
      // 键盘样式
      keyboardType: TextInputType.text,
      // 是否自动聚焦
      autofocus: true,
      // 设置加密
      obscureText: true,
      // 加密后的字符样式。
      obscuringCharacter: '*',
      // 光标宽度，默认为 2.0
      cursorWidth: 5.0,
      // 光标颜色
      cursorColor: Colors.red,
      // 自动填充
      // autofillHints: Iterable.castFrom(source),
      // 点击输入框
      onTap: () {
        print('点击输入框');
      },
      // 每次输入框文字改变，均会执行
      onChanged: (value) {
        print('输入框内的文本：$value');
      },
      // 点击完成按钮
      onSubmitted: (value) {
        print('点击完成按钮：$value');
      },
      // 输入完成，提交按钮点击后会先执行这里
      onEditingComplete: () {
        print('输入完成');
      },
    );
  }

  TextEditingController _controller() {
    TextEditingController textController = TextEditingController(text: '');
    textController.addListener(() {
      // print(textController.text);
    });
    return textController;
  }

  InputDecoration _normalDecoration() {
    return InputDecoration(
      // 是否填充
      filled: true,
      // 填充色
      fillColor: Colors.lightBlue.shade100,
      // icon: Icon(Icons.abc),
      // 修改下划线颜色，没有焦点时它会起作用
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.orange, width: 1.0, style: BorderStyle.solid),
      ),
      // 修改下划线颜色，有焦点时它会起作用
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.red, width: 10.0, style: BorderStyle.solid),
      ),
      prefix: SizedBox(
        width: 64.0,
        // height: 36.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(
              Icons.phone,
              color: Colors.cyan,
            ),
            Text(
              '+86',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 18.0,
              ),
            )
          ],
        ),
      ),
      // 占位文本，位于输入框光标后，输入内容为空时展示
      hintText: '输入手机号',
      // 尾部图标，位于输入框内部最右侧
      suffixIcon: const Icon(
        Icons.clear,
        color: Colors.red,
      ),
    );
  }
}
