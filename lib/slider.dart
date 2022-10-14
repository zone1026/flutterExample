// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZSliderWidget extends StatefulWidget {
  const YZSliderWidget({Key? key}) : super(key: key);
  @override
  YZSliderWidgetState createState() => YZSliderWidgetState();
}

class YZSliderWidgetState extends State<YZSliderWidget> {
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
        title: const Text("Slider"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _slider(),
              _sliderTheme(),
            ],
          ),
        ),
      ),
    );
  }

  double seekValue = 0.1;
  Slider _slider() {
    return Slider(
      // 最小值，默认为 0.0
      min: 0.0,
      // 最大值，默认为 1.0
      max: 1.0,
      // 已激活颜色
      activeColor: Colors.red,
      // 滑块颜色
      thumbColor: Colors.black,
      // 轨道颜色
      inactiveColor: Colors.blue,
      // 气泡文本
      label: 'value $seekValue',
      // 刻度数量，没有刻度时，label 不展示
      divisions: 10,
      // 当前 Slider 滑块位置的值，注意不可以超出 min 和 max 的范围，否则会报错
      value: seekValue,
      // 滑动开始
      onChangeStart: (value) {
        print('slider start : $value');
      },
      // 正在滑动或者点击时值变化
      onChanged: (value) {
        print('slider change : $value');
        seekValue = value;
        setState(() {});
      },
      // 滑动结束
      onChangeEnd: (value) {
        print('slider end : $value');
      },
    );
  }

  SliderTheme _sliderTheme() {
    return SliderTheme(
      // 自定义样式
      data: const SliderThemeData(
        // 轨道高度
        trackHeight: 20.0,
        // 滑块颜色
        thumbColor: Colors.white,
        // 滑块左侧轨道颜色
        activeTrackColor: Colors.red,
        // 滑块左侧刻度颜色
        activeTickMarkColor: Colors.green,
        // 滑块右侧侧轨道颜色
        inactiveTrackColor: Colors.orange,
        // 滑块右侧刻度颜色
        inactiveTickMarkColor: Colors.yellow,
        // 滑块按下去时周边颜色
        overlayColor: Colors.black,
        overlappingShapeStrokeColor: Colors.cyan,
        // 滑块按下形状
        overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
        // 刻度气泡颜色
        valueIndicatorColor: Colors.red,
        // 气泡文本TextStyle
        valueIndicatorTextStyle: TextStyle(color: Colors.white, fontSize: 28.0),
        // 气泡显示方式，默认为 ShowValueIndicator.onlyForDiscrete
        showValueIndicator: ShowValueIndicator.always,
        // minThumbSeparation: 100,
        // rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 20.0),
        // rangeTrackShape: RoundedRectRangeSliderTrackShape(),
      ),
      child: Slider(
        // 最小值，默认为 0.0
        min: 0.0,
        // 最大值，默认为 1.0
        max: 1.0,
        // 气泡文本
        label: 'value ${seekValue * 100.0}',
        // 刻度数量，没有刻度时，label 不展示
        divisions: 10,
        // 当前 Slider 滑块位置的值，注意不可以超出 min 和 max 的范围，否则会报错
        value: seekValue,
        // 滑动开始
        onChangeStart: (value) {
          print('slider start : $value');
        },
        // 正在滑动或者点击时值变化
        onChanged: (value) {
          print('slider change : $value');
          seekValue = value;
          setState(() {});
        },
        // 滑动结束
        onChangeEnd: (value) {
          print('slider end : $value');
        },
      ),
    );
  }
}
