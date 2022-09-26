// ignore_for_file: avoid_print

import 'dart:ui' as OffsetBase;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class YZTabBarViewWidget extends StatefulWidget {
  const YZTabBarViewWidget({Key? key}) : super(key: key);

  @override
  YZTabBarViewState createState() => YZTabBarViewState();
}

class YZTabBarViewState extends State<YZTabBarViewWidget>
    with TickerProviderStateMixin {
  var pageDatas = [];
  late TabController controller;

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
    controller = TabController(length: pageDatas.length, vsync: this);
  }

  // 初始化数据
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: const Text("TabBarView"),
        // 使用PreferredSize指定tabBar颜色
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Material(
            color: Colors.white,
            child: _tabBar(),
          ),
        ),
      ),
      body: WillPopScope(
          child: _tabBarView(),
          onWillPop: () async {
            return true;
          }),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      tabs: _tabList(),
      isScrollable: true,
      controller: controller,
      indicatorWeight: 5.0,
      indicatorColor: Colors.red,
      indicatorSize: TabBarIndicatorSize.tab,
      onTap: (int index) {
        print('click index = $index');
      },
    );
  }

  List<Widget> _tabList() {
    List<Widget> list = [];
    for (var page in pageDatas) {
      list.add(Tab(
        text: page['title'],
      ));
    }
    return list;
  }

  TabBarView _tabBarView() {
    return TabBarView(
      controller: controller,
      // 使用 BouncingScrollPhysics 实现iOS下弹性效果
      physics: const BouncingScrollPhysics(),
      dragStartBehavior: DragStartBehavior.start,
      children: _tabBarViews(),
    );
  }

  List<Widget> _tabBarViews() {
    List<Widget> list = [];
    for (var page in pageDatas) {
      list.add(_listView(page['content']));
    }
    return list;
  }

  ListView _listView(List contents) {
    return ListView.separated(
      separatorBuilder: (BuildContext content, int index) {
        return const Divider(
          height: 0.5,
          thickness: 0.5,
          color: Colors.green,
          indent: 15.0,
          endIndent: 15.0,
        );
      },
      itemCount: contents.length,
      itemBuilder: (BuildContext content, int index) {
        var title = contents[index];
        return ListTile(
          style: ListTileStyle.list,
          dense: false,
          // 左侧组件 最小宽度
          minLeadingWidth: 20.0,
          // 垂直方向 最小内边距
          minVerticalPadding: 8.0,
          // 标题和左右组件的水平间隔
          horizontalTitleGap: 8.0,
          selectedColor: Colors.cyan,
          iconColor: Colors.red,
          focusColor: Colors.orange,
          title: Text(
            '$title',
            style: TextStyle(
              fontSize: index * 3 + 15.0,
              color: Colors.red,
            ),
          ),
          onTap: () {
            print('$title');
          },
          leading: const Icon(
            // color: Colors.red,
            Icons.favorite,
            size: 20.0,
          ),
          // content 内间距
          contentPadding: const EdgeInsets.only(left: 15.0),
        );
      },
    );
  }
}
