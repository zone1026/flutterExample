// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZDataTableWidget extends StatefulWidget {
  const YZDataTableWidget({Key? key}) : super(key: key);
  @override
  YZDataTableWidgetState createState() => YZDataTableWidgetState();
}

class YZDataTableWidgetState extends State<YZDataTableWidget> {
  final List<YZDataTableModel> _datas = [];

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    _datas.add(YZDataTableModel('鲁班七号', '射手', '8612', '15'));
    _datas.add(YZDataTableModel('兰陵王', '刺客', '7023', '10'));
    _datas.add(YZDataTableModel('东皇太一', '辅助', '4697', '7'));
    _datas.add(YZDataTableModel('夏侯惇', '坦克', '5316', '9'));
    _datas.add(YZDataTableModel('不知火舞', '法师', '7321', '12'));
    _datas.add(YZDataTableModel('马超', '战士', '7943', '13'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("DataTable"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _dataTable(),
        ),
      ),
    );
  }

  bool _sortAscending = false;
  DataTable _dataTable() {
    return DataTable(
      // 有排列箭头的列，仅仅是展示箭头
      sortColumnIndex: 2,
      // 排列顺序，仅仅是箭头向上还是向下
      sortAscending: _sortAscending,
      // 左上角全选按钮点击回调
      onSelectAll: (value) {
        print('onSelectAll');
      },
      // 装饰
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 3.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      // Rows 中每条 Row 高度
      dataRowHeight: 44.0,
      dataTextStyle: const TextStyle(fontSize: 18.0, color: Colors.black45),
      // 顶部 Row 高度
      headingRowHeight: 64.0,
      headingTextStyle: const TextStyle(fontSize: 18.0, color: Colors.red),
      // checkbox，默认为左侧边距，默认24
      checkboxHorizontalMargin: 15.0,
      // 左侧边距，默认24
      horizontalMargin: 0.0,
      // 每一列间距
      columnSpacing: 64.0,
      // 是否展示左侧 checkbox，默认为 true，设置为 false，最左侧不展示 checkbox
      showCheckboxColumn: true,
      // 分割线宽度
      dividerThickness: 3.0,
      // 列数组 <DataColumn>
      columns: _columns(),
      // 行数组 <DataRow>
      rows: _rows(),
    );
  }

  List<DataColumn> _columns() {
    List<DataColumn> columns = [];
    columns.add(const DataColumn(label: Text('英雄')));
    columns.add(const DataColumn(label: Text('角色')));
    columns.add(
      DataColumn(
        // 文本
        label: const Text('等级'),
        // 长按提示
        tooltip: '这代表英雄的等级',
        // 是否居右，默认为 false
        numeric: true,
        // 点击排序箭头回调函数
        onSort: (columnIndex, ascending) {
          print('index = $columnIndex, ascending = $ascending');
          // 升序
          // level 用的是 String 类型，如果不转换直接比较，排序会出现问题
          if (ascending == true) {
            _datas.sort((a, b) {
              return (int.parse(a.level)).compareTo(int.parse(b.level));
            });
          } else {
            _datas.sort((a, b) {
              return (int.parse(b.level)).compareTo(int.parse(a.level));
            });
          }

          _sortAscending = ascending;
          setState(() {});
        },
      ),
    );
    columns.add(const DataColumn(label: Text('战力')));

    return columns;
  }

  List<DataRow> _rows() {
    List<DataRow> rows = [];
    for (var model in _datas) {
      rows.add(
        DataRow(
          // <DataCell> 数组
          cells: [
            DataCell(Text(model.name)),
            DataCell(Text(model.type)),
            DataCell(Text(model.level)),
            DataCell(
              // 子控件
              Text(model.power),
              // 是否是 placeholder，默认为 false，设置为 true 时 Text 会变成灰色 placeholder
              placeholder: true,
              // 是否展示编辑图标
              showEditIcon: true,
              onTap: () {
                print('DataCell.onTap');
              },
            )
          ],
          // 左侧 checkbox 点击事件
          onSelectChanged: (value) {
            model.selected = value!;
            setState(() {});
          },
          // checkbox 是否选中，默认为 false
          selected: model.selected,
          // DataRow 颜色回调函数
          color: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.red;
            }
            return Colors.grey;
          }),
        ),
      );
    }

    return rows;
  }
}

class YZDataTableModel extends Object {
  String name;
  String type;
  String power;
  String level;
  bool selected = false;

  YZDataTableModel(this.name, this.type, this.power, this.level);
}
