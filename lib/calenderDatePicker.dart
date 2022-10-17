// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZCalenderDatePickerWidget extends StatelessWidget {
  const YZCalenderDatePickerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Text(
          "CalenderDatePicker",
        ),
      ),
      body: ListView(
        children: [
          const Text('CalendarDataPicker year:'),
          _calendarDatePicker(DatePickerMode.year),
          const Text('CalendarDataPicker day:'),
          _calendarDatePicker(DatePickerMode.day),
        ],
      ),
    );
  }

  CalendarDatePicker _calendarDatePicker(DatePickerMode mode) {
    DateTime now = DateTime.now();
    return CalendarDatePicker(
      initialDate: DateTime(now.year, now.month, now.day - 1),
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: DateTime(now.year + 1, now.month, now.day),
      currentDate: DateTime(now.year, now.month, now.day - 1),
      initialCalendarMode: mode,
      // 选中日期改变回调函数
      onDateChanged: (dateTime) {
        print('onDateChanged: $dateTime');
      },
      // 月份改变回调函数
      onDisplayedMonthChanged: (value) {
        print("onDisplayedMonthChanged $value");
      },
      // 筛选日期可不可点击
      selectableDayPredicate: (day) {
        if (day.day == 17) {
          return false;
        }
        return true;
      },
    );
  }
}
