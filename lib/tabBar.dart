// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZTabBarWidget extends StatefulWidget {
  const YZTabBarWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return YZTabBarState();
  }
}

class YZTabBarState extends State<YZTabBarWidget> {
  var pageDatas = [];

  @override
  void initState() {
    super.initState();

    initData();
  }

  void initData() {
    pageDatas.add({
      "title": "一年级英语",
      "content": ["我是一年级英语一班", "我是一年级英语二班", "我是一年级英语三班"]
    });
    pageDatas.add({
      "title": "二年级英语",
      "content": ["我是二年级英语一班", "我是二年级英语二班", "我是二年级英语三班"]
    });
    pageDatas.add({
      "title": "三年级英语",
      "content": ["我是三年级英语一班", "我是三年级英语二班", "我是三年级英语三班"]
    });
    pageDatas.add({
      "title": "四年级英语",
      "content": ["我是四年级英语一班", "我是四年级英语二班", "我是四年级英语三班"]
    });
    pageDatas.add({
      "title": "五年级英语",
      "content": ["我是五年级英语一班", "我是五年级英语二班", "我是五年级英语三班"]
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   // length 一定要赋值，并且与 tabs 的数量相同，不然会报错
    //   length: 5,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('TabBar'),
    //       bottom: _tabBar(),
    //     ),
    //     body: Container(color: Colors.grey),
    //   ),
    // );
    return _tabController();
  }

  DefaultTabController _tabController() {
    return DefaultTabController(
      length: pageDatas.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar'),
          bottom: _tabBar(),
        ),
        body: Container(color: Colors.grey),
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      tabs: _tabs(),
      isScrollable: true,
      // 自定义 indicator时会优先执行自定义的 indicator，其他的设置会被覆盖掉。
      // indicator: const UnderlineTabIndicator(
      //   borderSide: BorderSide(
      //     color: Colors.red,
      //     width: 3.0,
      //   ),
      // ),
      // 不可与indicator属性同时设置
      indicatorColor: Colors.blue,
      indicatorWeight: 12.0,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: const EdgeInsets.only(bottom: 15.0),
      labelColor: Colors.red,
      labelStyle: const TextStyle(fontSize: 20.0),
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: const TextStyle(fontSize: 15.0),
      padding: const EdgeInsets.only(top: 30.0, left: 35.0),
      onTap: (int index) {
        print("点击了 index = $index");
      },
    );
  }

  List<Widget> _tabs() {
    List<Widget> tabList = [];
    for (var page in pageDatas) {
      tabList.add(Tab(
        text: page['title'],
      ));
    }
    return tabList;
  }
}
