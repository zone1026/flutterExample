// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:my_app/container.dart';
import 'package:my_app/row.dart';
import 'package:my_app/column.dart';
import 'package:my_app/image.dart';
import 'package:my_app/text.dart';
import 'package:my_app/icon.dart';
import 'package:my_app/elevatedButton.dart';
import 'package:my_app/scaffold.dart';
import 'package:my_app/appBar.dart';
import 'package:my_app/bottomNavigationBar.dart';
import 'package:my_app/tabBar.dart';

class YZHomeVc extends StatefulWidget {
  const YZHomeVc({Key? key}) : super(key: key);

  @override
  YZHomeState createState() => YZHomeState();
}

class YZHomeState extends State<YZHomeVc> {
  var listData = [];

  @override
  void initState() {
    super.initState();
    // 封装数据初始化方法，为数据源添加数据，未来也可以在这里做网络请求
    initData();
  }

  void initData() {
    listData.add("Container");
    listData.add("Row");
    listData.add("Column");
    listData.add("Image");
    listData.add("Text");
    listData.add("Icon");
    listData.add("ElevatedButton");
    listData.add("Scaffold");
    listData.add("AppBar");
    listData.add("BottomNavigationBar");
    listData.add("TabBar");

    listData.add("Home");

    // print(listData);

    setState(() {
      print("reload");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: const Text("widget list"),
      ),
      body: SafeArea(
        child: ListView.builder(
          // separatorBuilder: (BuildContext context, int index) {
          // return Divider(
          //   height: 0.5,
          //   color: (index % 2 == 0)
          //       ? const Color(0xffe60012)
          //       : const Color(0xFF666666),
          // );
          // },
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(15.0),
          itemCount: listData.length,
          // 决定列表的长度是否仅包裹其内容的长度。
          // 当ListView嵌在一个无限长的容器组件中时，shrinkWrap必须为true，否则Flutter会给出警告;
          // shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          // 确定每一个item的高度 会让item加载更加高效,
          // itemExtent: 44,
          itemBuilder: (context, index) {
            var data = listData[index];
            // print(data);
            // Column表示child中组件为上下布局方式
            return Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  // textColor: Colors.cyan,
                  title: Text(
                    '$data',
                    style: const TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                  // subtitle: Text(
                  //   '${data["desc"]}',
                  //   style: const TextStyle(fontSize: 13.0, color: Colors.grey),
                  // ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  // selectedColor: Colors.grey,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return _routeWidget(index);
                    }));
                  },
                ),
                Divider(
                  // Divider组件所占用的区域高度，并非分割线的高度
                  height: 0.5,
                  // 分割线的厚度，真正的分割线的高度
                  thickness: 0.5,
                  // 起点缩进距离
                  indent: 8.0,
                  // 终点缩进距离
                  endIndent: 8.0,
                  color: (index % 2 == 0)
                      ? const Color(0xffe60012)
                      : const Color(0xFF666666),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _routeWidget(int index) {
    switch (index) {
      case 0:
        {
          return const YZContainerVc();
        }
      case 1:
        {
          return const YZRowVc();
        }
      case 2:
        {
          return const YZColumnVc();
        }
      case 3:
        {
          return const YZImageWidget();
        }
      case 4:
        {
          return const YZTextWidget();
        }
      case 5:
        {
          return const YZIconWidget();
        }
      case 6:
        {
          return const YZElevatedButtonWidget();
        }
      case 7:
        {
          return const YZScaffoldWidget();
        }
      case 8:
        {
          return const YZAppBarWidget();
        }
      case 9:
        {
          return const YZBottomNavigationBarWidget();
        }
      case 10:
        {
          return const YZTabBarWidget();
        }
      default:
        return const YZHomeVc();
    }
  }
}
