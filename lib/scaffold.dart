import 'package:flutter/material.dart';

class YZScaffoldWidget extends StatefulWidget {
  const YZScaffoldWidget({Key? key}) : super(key: key);
  @override
  YZScaffoldState createState() => YZScaffoldState();
}

class YZScaffoldState extends State<YZScaffoldWidget> {
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
        title: const Text("Scaffold"),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
