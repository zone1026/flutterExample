import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as OffsetBase;

class YZAppBarWidget extends StatelessWidget {
  const YZAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'AppBar',
        style: TextStyle(
          color: Colors.cyan,
        ),
      ),
      // title 是否居中，
      centerTitle: true,
      // 使用 titleSpacing 来控制 title 的左侧偏移量
      titleSpacing: 32.0,
      actions: _actions(),
      flexibleSpace: _flexibleSpaceBar(),
      leading: _leading(context),
      bottom: _preferredSize(),
      // backgroundColor: Colors.green,
      // 改变上方，电池、时间等图标颜色
      systemOverlayStyle: SystemUiOverlayStyle.light,
      // 改变 appbar 高度
      // toolbarHeight: 88.0,
      // 改变appbar按钮透明度
      toolbarOpacity: 0.5,
      // iconTheme 改变按钮主题。
      iconTheme: _iconThemeData(),
      // 使用 actionsIconTheme 改变 actions 按钮主题。
      // 注意与 iconTheme 的区别，iconTheme 改变了整个 appBar 的按钮，而 actions 仅仅改变 actions 按钮的主题。
      // 优先使用iconTheme属性数据
      actionsIconTheme: _iconThemeData(),
    );
  }

  // 自定义AppBar右侧功能键
  List<Widget> _actions() {
    return [
      Container(
        width: 44.0,
        color: Colors.red,
        child: const Icon(Icons.home),
      ),
      Container(
        width: 44.0,
        color: Colors.green,
        child: const Icon(Icons.favorite),
      ),
      Container(
        width: 44.0,
        color: Colors.blue,
        child: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
    ];
  }

  // 可折叠的应用栏
  FlexibleSpaceBar _flexibleSpaceBar() {
    return const FlexibleSpaceBar(
      title: Text(
        'AppBarFlexibleSpaceBar',
        style: TextStyle(color: Colors.red),
      ),
      centerTitle: false,
    );
  }

  // 使用 leading 制定 appbar 左侧按钮。
  Container _leading(BuildContext context) {
    return Container(
      width: 50.0,
      color: Colors.red,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
          return Colors.red;
        })),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    );
  }

  PreferredSize _preferredSize() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          color: Colors.green,
          height: 60.0,
          // child: const Text('Bottom'),
        ));
  }

  // iconTheme 改变按钮主题。
  IconThemeData _iconThemeData() {
    return const IconThemeData(
      color: Colors.black,
      size: 44.0,
      opacity: 0.5,
    );
  }
}
