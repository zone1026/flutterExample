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
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      persistentFooterButtons: _persistentFooterButtons(),
      drawer: const Drawer(),
      endDrawer: const Drawer(),
      bottomNavigationBar: _bottomNavigationBar(),
      bottomSheet: _bottomSheet(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Scaffold"),
    );
  }

  SafeArea _body() {
    return SafeArea(child: Container());
  }

  // 悬浮按钮
  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      foregroundColor: Colors.white,
      backgroundColor: Colors.red,
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.arrow_back),
    );
  }

  // 显示在底部导航条上方的一组按钮
  List<Widget> _persistentFooterButtons() {
    return [
      Container(
        width: 44.0,
        height: 64,
        color: Colors.red,
      ),
      Container(
        width: 44.0,
        height: 64.0,
        color: Colors.green,
      ),
      Container(
        width: 44.0,
        height: 64.0,
        color: Colors.blue,
      ),
    ];
  }

  // 底部导航条
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.red[600],
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'settings',
        ),
      ],
    );
  }

  // 一个持久停留在body下方，底部控件上方的控件
  BottomSheet _bottomSheet() {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return Container(
          height: 60.0,
          color: Colors.cyan,
          alignment: Alignment.center,
          child: const Text('Bottom Sheet'),
        );
      },
    );
  }
}
