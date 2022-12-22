// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class YZPainterWidget extends StatefulWidget {
  const YZPainterWidget({Key? key}) : super(key: key);
  @override
  _YZPainterWidgetState createState() => _YZPainterWidgetState();
}

class _YZPainterWidgetState extends State<YZPainterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<int> animation;
  // 点集
  // List<Offset> _points = [];
  late Star _star;

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    // 创建 AnimationController对象
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // 创建从25到150变化的animate对象
    animation = IntTween(begin: 5, end: 100).animate(controller)
      ..addListener(() {
        print(animation.value);
        // render(animation.value);
        renderStar(animation.value);
      })
      // ..联级运算符
      ..addStatusListener((status) {
        print('status : $status');
        if (status == AnimationStatus.completed) {
          // print(animation.value);
        }
      });

    _star = Star(5, 100, 50);
  }

  @override
  void dispose() {
    super.dispose();
    // 资源释放
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Painter'),
      ),
      body: CustomPaint(
        painter: _YZCustomPainterWidget(_star),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _points.clear();
          controller.stop();
          // 执行动画
          controller.forward();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  double x = 0;
  void render(double value) {
    // _points.add(Offset(x, -value));
    x++;
    setState(() {});
  }

  void renderStar(int value) {
    _star.R = value;
    setState(() {});
  }
}

class _YZCustomPainterWidget extends CustomPainter {
  late Paint mPaint;
  late Paint gridPaint;
  // final List<Offset> _points;
  late final Star _star;

  _YZCustomPainterWidget(this._star) {
    mPaint = Paint()
      ..color = Colors.deepOrange
      ..strokeWidth = 3.0;

    gridPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制网格
    canvas.drawPath(
      _gridPath(area: const Size(500.0, 1000.0)),
      gridPaint,
    );
    canvas.translate(200.0, 200.0);
    // 绘制五角星
    // canvas.drawPath(_nStarPath(3, 100.0, 100.0), mPaint);

    // canvas.drawPoints(PointMode.lines, _points, mPaint);

    // 绘制星星
    canvas.drawPath(_nStarPath(_star.num, _star.R, _star.r), mPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  /// 可以创建一个外接圆半径为[R],内接圆半径半径为[r]的[num]角星
  Path _nStarPath(int num, int R, int r) {
    Path path = Path();
    double perDeg = 360 / num;
    double degA = perDeg / 2.0 / 2.0;
    double degB = (360 / (num - 1) - degA) / 2.0 + degA;

    path.moveTo(cos(_rad(degA)) * R, (-sin(_rad(degA)) * R));

    for (int i = 0; i < num; i++) {
      path.lineTo(cos(_rad(degA + perDeg * i)) * R,
          (-sin(_rad(degA + perDeg * i)) * R));

      path.lineTo(cos(_rad(degB + perDeg * i)) * r,
          (-sin(_rad(degB + perDeg * i)) * r));
    }
    path.close();

    return path;
  }

  /// 创建一个区域是[area]，小格边长为[step]的网格的路径
  // ignore: unused_element
  Path _gridPath({double step = 20, required Size area}) {
    Path path = Path();
    for (int i = 0; i < area.height / step + 1; i++) {
      // 移动画笔
      path.moveTo(0.0, step * i);
      // 画直线
      path.lineTo(area.width, step * i);
    }

    for (int i = 0; i < area.width / step + 1; i++) {
      // 画纵线
      path.moveTo(step * i, 0.0);
      path.lineTo(step * i, area.height);
    }

    return path;
  }

  /// 角度转化为pi值
  double _rad(double deg) {
    return deg * pi / 180.0;
  }
}

class Star extends Object {
  int num;
  int R;
  int r;
  Star(this.num, this.R, this.r);
}
