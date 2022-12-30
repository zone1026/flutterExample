// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// 为其子widget使用表格布局算法的widget
class YZTableWidget extends StatelessWidget {
  const YZTableWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Table',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: _table(),
      ),
    );
  }
}

/// children = const <TableRow>[]：
/// columnWidths：列宽 Map<int, TableColumnWidth>
/// defaultColumnWidth = const FlexColumnWidth(1.0)：未在columnWidths中指定的列的列宽
/// textDirection：文本方向
/// border：Table的边框 TableBorder
/// defaultVerticalAlignment = TableCellVerticalAlignment.top：TableCell垂直方向对其方式
/// textBaseline = TextBaseline.alphabetic：文本基线
///
Table _table() {
  return Table(
    children: _rowList(),

    /// FixedColumnWidth(value)：固定列宽
    /// FlexColumnWidth(value)：使用剩余空间的列宽，如果由多个按照value为权重分配
    /// FractionColumnWidth(value)：百分比列宽 = value*(Table.maxWidth)
    /// IntrinsicColumnWidth(value)：适应内容来分配列宽，value为权重分配额外空间，这个方法比较耗费性能
    /// MaxColumnWidth(TableColumnWidth a,TableColumnWidth b)：取a，b中大的那个为列宽
    /// MinColumnWidth(TableColumnWidth a,TableColumnWidth b)：取a，b中小的那个为列宽
    columnWidths: const {
      0: FlexColumnWidth(2),
      1: FlexColumnWidth(1),
      2: FixedColumnWidth(44.0),
      3: FixedColumnWidth(44.0),
      // 2: IntrinsicColumnWidth(flex: 1),
    },

    /// top = BorderSide.none：上边框
    /// right = BorderSide.none：右边框
    /// bottom = BorderSide.none：下边框
    /// left = BorderSide.none：左边框
    /// horizontalInside = BorderSide.none：内部横向线
    ///  verticalInside = BorderSide.none：内部纵向线
    border: TableBorder(
      top: const BorderSide(
        color: Colors.red,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      left: const BorderSide(
        color: Colors.green,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      bottom: const BorderSide(
        color: Colors.blue,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      right: const BorderSide(
        color: Colors.amber,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      horizontalInside: const BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      verticalInside: const BorderSide(
        color: Colors.cyan,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),

    /// top：TableCell位于单元格顶部
    /// middle：TableCell位于单元格中部
    /// bottom：TableCell位于单元格底部
    /// baseline：TableCell位于基线
    /// fill：TableCell铺满单元格，根据官方注释，如果设置这个Table的每行高度都会变为0
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
  );
}

/// decoration：装饰
/// children
List<TableRow> _rowList() {
  return [
    const TableRow(
      decoration: BoxDecoration(color: Colors.white),
      children: [
        Text(
          'name',
          textAlign: TextAlign.center,
        ),
        Text(
          'sex',
          textAlign: TextAlign.center,
        ),
        Text(
          'age',
          textAlign: TextAlign.center,
        ),
      ],
    ),
    const TableRow(
      decoration: BoxDecoration(color: Colors.grey),
      children: [
        Text(
          'one',
          textAlign: TextAlign.center,
        ),
        Text(
          'man',
          textAlign: TextAlign.center,
        ),
        Text(
          '18',
          textAlign: TextAlign.center,
        ),
      ],
    ),
    const TableRow(
      decoration: BoxDecoration(color: Colors.red),
      children: [
        Text(
          'two',
          textAlign: TextAlign.center,
        ),
        Text(
          'woman',
          textAlign: TextAlign.center,
        ),
        Text(
          '20',
          textAlign: TextAlign.center,
        ),
      ],
    ),
    const TableRow(
      decoration: BoxDecoration(color: Colors.green),
      children: [
        Text(
          'three',
        ),
        Text(
          'unknown sex ?',
        ),
        Text(
          '?',
        ),
      ],
    ),
  ];
}
