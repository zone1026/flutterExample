// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// widget通知监听
/// 通知是由下而上去传递的，所以才会称作【冒泡通知】
class YZNotificationListenerWidget extends StatelessWidget {
  const YZNotificationListenerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NotificationListener',
        ),
      ),
      // body: _listener(),
      body: _customListener(),
    );
  }
}

NotificationListener _customListener() {
  return NotificationListener<_YZCustomNotification>(
    onNotification: (notification) {
      print('1 notification msg ${notification.msg}');
      return true;
    },
    child: NotificationListener<_YZCustomNotification>(
      onNotification: (notification) {
        print('2 notification msg ${notification.msg}');

        /// 2级NotificationListener处消费掉当前的通知了，所以不再向1级NotificationListener传递通知了，
        /// 如果将2级NotificationListener处设置为false，则会传递
        return false;
      },
      child: Builder(builder: (BuildContext context) {
        return Center(
          child: ElevatedButton(
            onPressed: () {
              _YZCustomNotification('click elevated Button').dispatch(context);
            },
            child: const Text('ElevatedButton'),
          ),
        );
      }),
    ),
  );
}

/// ScrollStartNotification：滑动开始通知
/// ScrollUpdateNotification：滑动中通知，滑动过程中会一直回调
/// ScrollEndNotification：滑动结束通知
/// OverscrollNotification：滑动位置未改变通知，这个一般只有在滑动到列表边界才会回调，且需要设置不可越界，即physics为ClampingScrollPhysics，这里要注意安卓默认是这样，但是ios平台默认是弹性边界
/// UserScrollNotification：用户滑动通知，这个跟ScrollUpdateNotification的区别是他指挥有滑动开始后以及滑动结束后回调
/// OverscrollIndicatorNotification：这是滑动指示器的通知监听，例如Scrollbar，需要注意的是这个只有在滑动到头部或者尾部才会回调，而且滑动布局也需要是不可越界的，即physics为ClampingScrollPhysics
NotificationListener _listener() {
  return NotificationListener<ScrollNotification>(
    onNotification: (notification) {
      /// pixels：当前绝对位置
      /// atEdge：是否在顶部或底部
      /// axis：垂直或水平滚动
      /// axisDirection：滚动方向描述是down还是up，这个受列表reverse影响，正序就是down倒序就是up，并不代表列表是上滑还是下滑
      /// extentAfter：视口底部距离列表底部有多大
      /// extentBefore：视口顶部距离列表顶部有多大
      /// extentInside：视口范围内的列表长度
      /// maxScrollExtent：最大滚动距离，列表长度-视口长度
      /// minScrollExtent：最小滚动距离
      /// viewportDimension：沿滚动方向视口的长度
      /// outOfRange：是否越过边界
      ScrollMetrics metrics = notification.metrics;

      print('#################### ScrollMetrics ####################');
      print('pixels = ${metrics.pixels}');
      print('atEdge = ${metrics.atEdge}');
      print('axis = ${metrics.axis}');
      print('axisDirection = ${metrics.axisDirection}');
      print('extentInside = ${metrics.extentInside}');
      print('minScrollExtent = ${metrics.minScrollExtent}');
      print('maxScrollExtent = ${metrics.maxScrollExtent}');
      print('viewportDimension = ${metrics.viewportDimension}');
      print('#################### ScrollMetrics ####################');
      print('');

      /// true表示消费掉当前通知不再向上一级NotificationListener传递通知，
      /// false则会再向上一级NotificationListener传递通知
      return false;
    },
    child: NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        print('######### ScrollUpdateNotification ########');
        return false;
      },
      child: NotificationListener<OverscrollNotification>(
        onNotification: (notification) {
          print('######### OverscrollNotification ########');
          return false;
        },
        child: NotificationListener<ScrollStartNotification>(
          onNotification: (notification) {
            print('######### ScrollStartNotification ########');
            return false;
          },
          child: NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              print('######### ScrollEndNotification ########');
              return false;
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('item $index'),
                );
              },
              itemCount: 30,
              reverse: false,
            ),
          ),
        ),
      ),
    ),
  );
}

class _YZCustomNotification extends Notification {
  _YZCustomNotification(this.msg);

  final String msg;
}
