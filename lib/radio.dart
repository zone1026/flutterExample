// ignore_for_file: avoid_print, unused_field

import 'package:flutter/material.dart';

class YZRadioWidget extends StatefulWidget {
  const YZRadioWidget({Key? key}) : super(key: key);
  @override
  YZRadioWidgetState createState() => YZRadioWidgetState();
}

class YZRadioWidgetState extends State<YZRadioWidget> {
  final List<YZRadioModel> _datas = [];
  late int groupValue;

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();

    groupValue = _datas.first.index;
  }

  // 初始化数据
  void initData() {
    _datas.add(YZRadioModel(1, 'game'));
    _datas.add(YZRadioModel(2, 'social'));
    _datas.add(YZRadioModel(3, 'shopping'));
    _datas.add(YZRadioModel(4, 'recreation'));
    _datas.add(YZRadioModel(5, 'movie'));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Radio"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _datas.length,
          itemBuilder: (context, index) {
            YZRadioModel model = _datas[index];
            return _radioRow(model);
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
            color: Colors.red,
            alignment: Alignment.center,
            child: Text(
              _selectedRadio(),
              style: const TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          );
        });
  }

  String _selectedRadio() {
    String str = '';
    for (YZRadioModel model in _datas) {
      if (model.index == groupValue) {
        str = "你当前选择的是: ${model.text}  ";
        break;
      }
    }
    return str;
  }

  Row _radioRow(YZRadioModel model) {
    return Row(
      children: [
        _radio(model),
        Text(
          model.text,
        )
      ],
    );
  }

  Radio _radio(YZRadioModel model) {
    return Radio(
      // 设置一个标识
      value: model.index,
      // 选中的标识
      groupValue: groupValue,
      activeColor: Colors.red,
      onChanged: (value) {
        print(value);
        groupValue = model.index;
        setState(() {});
      },
    );
  }
}

class YZRadioModel extends Object {
  int index;
  String text;

  YZRadioModel(this.index, this.text);
}
