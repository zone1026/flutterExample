import 'package:flutter/material.dart';

import 'package:my_app/route.dart';
import 'package:my_app/appBar.dart';
import 'package:my_app/bottomNavigationBar.dart';
import 'package:my_app/tabBar.dart';
import 'package:my_app/tabBarView.dart';
import 'package:my_app/buttonBar.dart';
import 'package:my_app/bottomSheet.dart';

import 'package:my_app/floatingActionButton.dart';
import 'package:my_app/elevatedButton.dart';
import 'package:my_app/textButton.dart';
import 'package:my_app/iconButton.dart';
import 'package:my_app/popupMenuButtton.dart';
import 'package:my_app/checkBox.dart';
import 'package:my_app/radio.dart';
import 'package:my_app/switch.dart';

import 'package:my_app/textField.dart';
import 'package:my_app/inputDecoration.dart';
import 'package:my_app/focusNode.dart';

import 'package:my_app/slider.dart';
import 'package:my_app/rangeSlider.dart';
import 'package:my_app/showPicker.dart';
import 'package:my_app/calenderDatePicker.dart';
import 'package:my_app/cupertinoDatePicker.dart';
import 'package:my_app/cupertinoTimerPicker.dart';
import 'package:my_app/dialog.dart';

class YZRouteManager {
  // 路由map表
  final Map<String, WidgetBuilder> routeMap = {};
  // 拦截参数，用来拦截路由表
  final _isLogin = true;
  final _otherJudge = true;

  // 初始化注册路由
  YZRouteManager() {
    routeMap.addAll({'/': (context) => const YZRouteHomeWidget()});
    routeMap.addAll(_getBarRouteMap());
    routeMap.addAll(_getButtonMap());
    routeMap.addAll(_getInputMap());
    routeMap.addAll(_getWidgetMap());
  }

// ***************** public method ***************** //

  // 自定义路由
  MaterialPageRoute routeWithSetting(RouteSettings settings) {
    // 拦截未登录路由
    if (_isLogin == false) {
      return _loginRoute(settings);
    }

    // 拦截其他情况路由
    if (_otherJudge == false) {
      return _ohterRoute(settings);
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

// ***************** private method ***************** //

  // 配置bar相关路由
  Map<String, WidgetBuilder> _getBarRouteMap() {
    return {
      '/bar/appBar': (context) => const YZAppBarWidget(),
      '/bar/bottomNavigationBar': (context) =>
          const YZBottomNavigationBarWidget(),
      '/bar/tabBar': (context) => const YZTabBarWidget(),
      '/bar/tabBarView': (context) => const YZTabBarViewWidget(),
      '/bar/buttonBar': (context) => const YZButtonBarWidget(),
      '/bar/bottomSheet': (context) => const YZBottomSheetWidget(),
    };
  }

  // 配置button相关路由
  Map<String, WidgetBuilder> _getButtonMap() {
    return {
      '/button/floatingActionButton': (context) =>
          const YZFloatingActionButtonWidget(),
      '/button/elevatedButton': (context) => const YZElevatedButtonWidget(),
      '/button/textButton': (context) => const YZTextButtonWidget(),
      '/button/iconButton': (context) => const YZIconButtonWidget(),
      '/button/popupMenuButton': (context) => const YZPopupMenuButtonWidget(),
      '/button/checkBox': (context) => const YZCheckBoxWidget(),
      '/button/radio': (context) => const YZRadioWidget(),
      '/button/switch': (context) => const YZSwitchWidget(),
    };
  }

// 配置输入框相关路由
  Map<String, WidgetBuilder> _getInputMap() {
    return {
      '/input/textField': (context) => const YZTextFieldWidget(),
      '/input/inputDecoration': (context) => const YZInputDecorationWidget(),
      '/input/focusNode': (context) => const YZFocusNodeWidget(),
    };
  }

  // 配置widget相关路由
  Map<String, WidgetBuilder> _getWidgetMap() {
    return {
      '/widget/slider': (context) => const YZSliderWidget(),
      '/widget/rangeSlider': (context) => const YZRangeSliderWidget(),
      '/widget/showPicker': (context) => const YZShowPickerWidget(),
      '/widget/calenderDatePicker': (context) =>
          const YZCalenderDatePickerWidget(),
      '/widget/cupertinoDatePicker': (context) =>
          const YZCupertinoDatePickerWidget(),
      '/widget/cupertinoTimerPicker': (context) =>
          const YZCupertinoTimerPickerWidget(),
      '/widget/dialog': (context) => const YZDialogWidget(),
    };
  }

  // 登录路由
  MaterialPageRoute _loginRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: ((BuildContext context) => const Scaffold()));
  }

  // 拦截其他情况路由
  MaterialPageRoute _ohterRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: ((BuildContext context) => const Scaffold()));
  }
}
