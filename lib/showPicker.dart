// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZShowPickerWidget extends StatefulWidget {
  const YZShowPickerWidget({Key? key}) : super(key: key);
  @override
  YZShowPickerWidgetState createState() => YZShowPickerWidgetState();
}

class YZShowPickerWidgetState extends State<YZShowPickerWidget> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: const Text("ShowPicker"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            _showDatePickerButton(context),
            _showDatePickerThemeButton(context),
            _showTimePickerButton(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton _showDatePickerButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.red),
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
      ),
      onPressed: () async {
        var date = await showDatePicker(
          context: context,
          // 日历初始化日期
          initialDate: DateTime.now(),
          // 日历开始日期
          firstDate: DateTime(2020, 6),
          // 日历结束日期
          lastDate: DateTime.now(),
          // DatePickerEntryMode.calendar 与 input 两种，分别为选择器和填写框
          initialEntryMode: DatePickerEntryMode.input,
          // 文字方向
          textDirection: TextDirection.rtl,
          // 当前日期
          currentDate: DateTime(2021, 8, 8),
          // locale: const Locale('fr', 'CH'),
          // 左上角文字
          helpText: 'helpText',
          // 取消按钮文字
          cancelText: 'cancelText',
          // 确认按钮文字
          confirmText: 'confirmText',
          // 格式错误是下方提示
          errorFormatText: 'errorFormatText',
          // 输入了不在 first 与 last 之间无效的日期提示语
          errorInvalidText: 'errorInvalidText',
          // 输入框默认提示语
          fieldLabelText: 'fieldLabelText',
          // 输入框上方提示语
          fieldHintText: 'fieldHintText',
          // 日期选择模式，默认为天数选择，DatePickerMode.day 与 DatePickerMode.year 两种
          initialDatePickerMode: DatePickerMode.day,
          // 自定义哪些可选
          selectableDayPredicate: (day) {
            // 设置不可选日期，这里将 2022-10-8设置不可选
            if (day == DateTime(2022, 10, 8)) {
              return false;
            }

            return true;
          },
        );
        print(date.toString());
      },
      child: const Text(
        'showDatePicker',
      ),
    );
  }

  ElevatedButton _showDatePickerThemeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020, 1, 1),
          lastDate: DateTime.now(),
          // 左上角文字
          helpText: 'helpText',
          // 取消按钮文字
          cancelText: 'cancelText',
          // 确认按钮文字
          confirmText: 'confirmText',
          // 格式错误是下方提示
          errorFormatText: 'errorFormatText',
          // 输入了不在 first 与 last 之间无效的日期提示语
          errorInvalidText: 'errorInvalidText',
          // 输入框默认提示语
          fieldLabelText: 'fieldLabelText',
          // 输入框上方提示语
          fieldHintText: 'fieldHintText',
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                cardColor: Colors.cyan,
                brightness: Brightness.light,
              ),
              child: child!,
            );
          },
        );
        if (date != null) {
          print('year: ${date.year}, month: ${date.month}, day: ${date.day}');
        }
      },
      child: const Text('showDatePickerThemeButton'),
    );
  }

  ElevatedButton _showTimePickerButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          // 左上角文字
          helpText: 'helpText',
          // 取消按钮文字
          cancelText: 'cancelText',
          // 确认按钮文字
          confirmText: 'confirmText',
          // 默认为 TimePickerEntryMode.dial。input 样式其实就是收起后的样子
          initialEntryMode: TimePickerEntryMode.dial,
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                cardColor: Colors.cyan,
                brightness: Brightness.light,
              ),
              child: child!,
            );
          },
        );
        if (time != null) {
          print('hour: ${time.hour}, minute: ${time.minute}');
        }
      },
      child: const Text('showTimePickerButton'),
    );
  }
}
