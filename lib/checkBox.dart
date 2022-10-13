// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';

/// 复选框
class YZCheckBoxWidget extends StatefulWidget {
  const YZCheckBoxWidget({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _YZCheckBoxState createState() => _YZCheckBoxState();
}

class _YZCheckBoxState extends State<YZCheckBoxWidget> {
  @override
  final List<YZCheckBoxModel> _datas = [];

  void initState() {
    super.initState();
// 初始化数据
    initData();
  }

// 初始化数据
  void initData() {
    _datas.add(YZCheckBoxModel(false, 'game'));
    _datas.add(YZCheckBoxModel(false, 'social'));
    _datas.add(YZCheckBoxModel(false, 'shopping'));
    _datas.add(YZCheckBoxModel(false, 'recreation'));
    _datas.add(YZCheckBoxModel(false, 'movie'));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: const Text("CheckBox"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _datas.length,
          itemBuilder: (context, index) {
            YZCheckBoxModel model = _datas[index];
            return _buildRow(model);
          },
        ),
      ),
      bottomSheet: _bottomSheet(),
    );
  }

  BottomSheet _bottomSheet() {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          height: 64.0,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(_selectedBoxs()),
        );
      },
    );
  }

  String _selectedBoxs() {
    String str = '';
    for (var model in _datas) {
      if (model.selected == true) {
        str = '$str${model.text} ';
      }
    }

    return str;
  }

  Row _buildRow(YZCheckBoxModel model) {
    return Row(
      children: [_checkbox(model), Text(model.text)],
    );
  }

  Checkbox _checkbox(YZCheckBoxModel model) {
    return Checkbox(
        // 是否选中
        value: model.selected,
        // 选中时填充颜色
        activeColor: Colors.red,
        // 选中时中间✔️颜色
        checkColor: Colors.black,
        // 三态复选框，默认 false，当设置为 true 时，设置 value = null，复选框中间会变成破折号(-)
        tristate: true,
        // 点击事件
        onChanged: (bool? value) {
          model.selected = !model.selected;
          setState(() {});
        });
  }
}

class YZCheckBoxModel extends Object {
  bool selected;
  String text;

  YZCheckBoxModel(this.selected, this.text);
}
