import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YZCupertinoTabBarWidget extends StatefulWidget {
  const YZCupertinoTabBarWidget({Key? key}) : super(key: key);
  @override
  YZCupertinoTabBarWidgetState createState() => YZCupertinoTabBarWidgetState();
}

class YZCupertinoTabBarWidgetState extends State<YZCupertinoTabBarWidget> {
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
    return CupertinoTabScaffold(
      tabBar: _cupertinoTabBar(),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            backgroundColor: Colors.yellow,
            middle: Text('CupertinoTabBar'),
          ),
          child: ListView(),
        );
      },
    );
  }

  CupertinoTabBar _cupertinoTabBar() {
    return CupertinoTabBar(
      items: [
        _bottomNavigationBarItem('One'),
        _bottomNavigationBarItem('Two'),
        _bottomNavigationBarItem('Three'),
        _bottomNavigationBarItem('Four'),
        _bottomNavigationBarItem('Five'),
      ],
      // 点击回调
      onTap: (value) {
        print(value);
      },
      // 设置默认选中位置
      currentIndex: 3,
      // tabbar 背景色
      backgroundColor: Colors.red,
      // 图标高亮颜色
      activeColor: Colors.white,
      // 图标未选中颜色
      inactiveColor: Colors.grey,
      // 图标大小
      iconSize: 22.0,
      // 边框，设置上方分割线
      border: const Border(top: BorderSide(color: Colors.green, width: 3.0)),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String title) {
    return BottomNavigationBarItem(
      // 图标
      icon: const Icon(Icons.favorite),
      // 高亮图标
      activeIcon: const Icon(Icons.home),
      // 标题
      label: title,
      // 背景色，仅在 BottomNavigationBar 中生效，在 iOS 风格组件中无效
      backgroundColor: Colors.red,
    );
  }
}
