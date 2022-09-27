import 'package:flutter/material.dart';

import 'package:my_app/route.dart';
import 'package:my_app/appBar.dart';
import 'package:my_app/bottomNavigationBar.dart';
import 'package:my_app/tabBar.dart';
import 'package:my_app/tabBarView.dart';

import 'package:my_app/floatingActionButton.dart';
import 'package:my_app/elevatedButton.dart';

class YZRouteManager {
  // 路由map表
  final Map<String, WidgetBuilder> routeMap = {};
  // 拦截参数，用来拦截路由表
  final _isLogin = true;
  final _otherJudge = true;

  // 初始化注册路由
  YZRouteManager() {
    routeMap.addAll({'/': (context) => const YZRouteHomeWidget()});
    routeMap.addAll(getBarRouteMap());
    routeMap.addAll(getButtonMap());
  }

  // 自定义路由
  MaterialPageRoute routeWithSetting(RouteSettings settings) {
    // 拦截未登录路由
    if (_isLogin == false) {
      return loginRoute(settings);
    }

    // 拦截其他情况路由
    if (_otherJudge == false) {
      return ohterRoute(settings);
    }

    WidgetBuilder? builder = routeMap[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder);
    }

    return MaterialPageRoute(
        builder: ((BuildContext context) => const Scaffold()));
  }

  // 未知路由
  MaterialPageRoute unknowRouteWithSetting(RouteSettings settings) {
    return MaterialPageRoute(
        builder: ((BuildContext context) => const Scaffold()));
  }

  // 配置bar相关路由
  Map<String, WidgetBuilder> getBarRouteMap() {
    return {
      '/appBar': (context) => const YZAppBarWidget(),
      '/bottomNavigationBar': (context) => const YZBottomNavigationBarWidget(),
      '/tabBar': (context) => const YZTabBarWidget(),
      '/tabBarView': (context) => const YZTabBarViewWidget(),
    };
  }

  // 配置button相关路由
  Map<String, WidgetBuilder> getButtonMap() {
    return {
      '/floatingActionButton': (context) =>
          const YZFloatingActionButtonWidget(),
      '/elevatedButton': (context) => const YZElevatedButtonWidget(),
    };
  }

  // 登录路由
  MaterialPageRoute loginRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: ((BuildContext context) => const Scaffold()));
  }

  // 拦截其他情况路由
  MaterialPageRoute ohterRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: ((BuildContext context) => const Scaffold()));
  }
}
