import 'package:flutter/material.dart';

/// 区间slider
class YZRangeSliderWidget extends StatefulWidget {
  const YZRangeSliderWidget({Key? key}) : super(key: key);
  @override
  YZRangeSliderWidgetState createState() => YZRangeSliderWidgetState();
}

class YZRangeSliderWidgetState extends State<YZRangeSliderWidget> {
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
        title: const Text("RangeSlider"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_rangeSlider(), _sliderTheme()],
          ),
        ),
      ),
    );
  }

  double sliderStartValue = 100.0;
  double sliderEndValue = 300.0;
  RangeSlider _rangeSlider() {
    return RangeSlider(
      activeColor: Colors.blue,
      inactiveColor: Colors.grey,
      min: 100.0,
      max: 500.0,
      labels: RangeLabels('start: $sliderStartValue', 'end: $sliderEndValue'),
      divisions: 10,
      values: RangeValues(sliderStartValue, sliderEndValue),
      onChanged: (value) {
        sliderStartValue = value.start;
        sliderEndValue = value.end;
        setState(() {});
      },
    );
  }

  SliderTheme _sliderTheme() {
    return SliderTheme(
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
          valueIndicatorTextStyle:
              TextStyle(color: Colors.white, fontSize: 28.0),
          // 气泡显示方式，默认为 ShowValueIndicator.onlyForDiscrete
          showValueIndicator: ShowValueIndicator.always,
        ),
        child: RangeSlider(
          min: 100.0,
          max: 500.0,
          // toStringAsFixed()这个方法会在保留小数的基础上对末位进行四舍五入
          // 所以在当存在99.999这种数字时，用这个就会出现问题
          labels: RangeLabels('start: ${sliderStartValue.toStringAsFixed(2)}',
              'end: ${sliderEndValue.toStringAsFixed(1)}'),
          divisions: 10,
          values: RangeValues(sliderStartValue, sliderEndValue),
          onChanged: (value) {
            sliderStartValue = value.start;
            sliderEndValue = value.end;
            setState(() {});
          },
        ));
  }
}
