// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

/// ListTile（List块）是一个固定高度的行，通常包含一个行前、行尾图标，以及一些文本
/// 可以理解为 ListView.item 或者 UITableViewCell
class YZListTileWidget extends StatelessWidget {
  const YZListTileWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Title',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          _normalTile(),
          const Padding(padding: EdgeInsets.only(top: 15.0)),
          _shapeTile()
        ],
      ),
    );
  }

  ListTile _normalTile() {
    return ListTile(
      // 左侧组件
      leading: const Icon(Icons.favorite),
      // 标题
      title: const Text('title'),
      // 副标题
      subtitle: const Text('subtitle'),
      // 右侧组件
      trailing: const Icon(Icons.check),
      // 是否使用缩小布局
      dense: false,
      visualDensity: const VisualDensity(horizontal: -4.0),
      // content 内间距
      contentPadding: const EdgeInsets.all(15.0),
      // 是否可用，改变颜色,事件不可触发，默认为 true
      enabled: true,
      // 点击事件回调
      onTap: () {
        print('onTap');
      },
      // 长按事件回调
      onLongPress: () {
        print('onLongPress');
      },
      // 是否选中
      selected: false,
      // 未选中时的icon颜色
      iconColor: Colors.red,
      // 未选中时的text颜色
      textColor: Colors.yellow,
      // 未选中时的tile背景颜色
      tileColor: Colors.green,
      // 选中时的icon&text color
      selectedColor: Colors.red,
      // 选中时的tile背景颜色
      selectedTileColor: Colors.cyan,
    );
  }

  ListTile _shapeTile() {
    return ListTile(
      // 左侧组件
      leading: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.yellow,
        child: Image.network(Constants.imageUlr),
      ),
      // 标题
      title: Row(
        children: const [Icon(Icons.title), Text('title')],
      ),
      // 副标题
      subtitle: Row(
        children: const [Icon(Icons.favorite), Text('subtitle')],
      ),
      // 右侧组件
      trailing: const Icon(Icons.check),
      // 是否使用缩小布局
      dense: false,
      visualDensity: const VisualDensity(horizontal: -4.0),
      // content 内间距
      contentPadding: const EdgeInsets.all(15.0),
      // 是否可用，仅改变颜色，默认为 true
      enabled: true,
      // 点击事件回调
      onTap: () {
        print('onTap');
      },
      // 长按事件回调
      onLongPress: () {
        print('onLongPress');
      },
      // 是否选中
      selected: true,
      // 未选中时的icon颜色
      iconColor: Colors.red,
      // 未选中时的text颜色
      textColor: Colors.yellow,
      // 未选中时的tile背景颜色
      tileColor: Colors.green,
      // 选中时的icon&text color
      selectedColor: Colors.red,
      // 选中时的tile背景颜色
      selectedTileColor: Colors.cyan,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(width: 3.0, color: Colors.red),
      ),
    );
  }
}
