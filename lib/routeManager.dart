// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:my_app/route.dart';
import 'package:my_app/appBar.dart';
import 'package:my_app/bottomNavigationBar.dart';
import 'package:my_app/tabBar.dart';
import 'package:my_app/tabBarView.dart';
import 'package:my_app/buttonBar.dart';
import 'package:my_app/bottomSheet.dart';
import 'package:my_app/snackBar.dart';
import 'package:my_app/cupertinoNavigationBar.dart';
import 'package:my_app/cupertinoTabBar.dart';
import 'package:my_app/cupertinoPageScaffold.dart';

import 'package:my_app/floatingActionButton.dart';
import 'package:my_app/elevatedButton.dart';
import 'package:my_app/textButton.dart';
import 'package:my_app/iconButton.dart';
import 'package:my_app/popupMenuButton.dart';
import 'package:my_app/checkBox.dart';
import 'package:my_app/radio.dart';
import 'package:my_app/switch.dart';
import 'package:my_app/cupertinoButton.dart';
import 'package:my_app/cupertinoSwitch.dart';

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
import 'package:my_app/expansionPanel.dart';
import 'package:my_app/chip.dart';
import 'package:my_app/tooltip.dart';
import 'package:my_app/dataTable.dart';
import 'package:my_app/card.dart';
import 'package:my_app/progressIndicator.dart';
import 'package:my_app/listTile.dart';
import 'package:my_app/stepper.dart';
import 'package:my_app/divider.dart';
import 'package:my_app/cupertinoActivityIndicator.dart';
import 'package:my_app/cupertinoAlertDialog.dart';
import 'package:my_app/cupertinoTabScaffold.dart';
import 'package:my_app/stack.dart';
import 'package:my_app/gridView.dart';
import 'package:my_app/customScrollView.dart';
import 'package:my_app/nestedScrollView.dart';
import 'package:my_app/sliverList.dart';
import 'package:my_app/sliverFixedExtentList.dart';
import 'package:my_app/sliverGrid.dart';
import 'package:my_app/sliverPadding.dart';
import 'package:my_app/sliverAppBar.dart';
import 'package:my_app/sliverPersistentHeader.dart';
import 'package:my_app/sliverToBoxAdapter.dart';
import 'package:my_app/sliverFillViewport.dart';
import 'package:my_app/sliverFillRemaining.dart';
import 'package:my_app/intrinsic.dart';
import 'package:my_app/showAndHide.dart';
import 'package:my_app/box.dart';
import 'package:my_app/transform.dart';
import 'package:my_app/customSingleChildLayout.dart';
import 'package:my_app/indexedStack.dart';
import 'package:my_app/flow.dart';
import 'package:my_app/table.dart';
import 'package:my_app/wrap.dart';
import 'package:my_app/listBody.dart';
import 'package:my_app/customMultiChildLayout.dart';
import 'package:my_app/builder.dart';
import 'package:my_app/notificationListener.dart';
import 'package:my_app/draggableScrollable.dart';
import 'package:my_app/draggable.dart';
import 'package:my_app/dragTarget.dart';
import 'package:my_app/longPressDraggable.dart';
import 'package:my_app/state.dart';

import 'package:my_app/painter.dart';

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
    routeMap.addAll(_getAnimationMap());
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
      '/bar/snackBar': (context) => const YZSnackBarWidget(),
      '/widget/cupertinoNavigationBar': (context) =>
          const YZCupertinoNavigationBarWidget(),
      '/widget/cupertinoTabBar': (context) => const YZCupertinoTabBarWidget(),
      '/widget/cupertinoPageScaffold': (context) =>
          const YZCupertinoPageScaffoldWidget(),
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
      '/button/cupertinoButton': (context) => const YZCupertinoButtonWidget(),
      '/button/cupertinoSwitch': (context) => const YZCupertinoSwitchWidget(),
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
      '/widget/expansionPanel': (context) => const YZExpansionPanelWidget(),
      '/widget/chip': (context) => const YZChipWidget(),
      '/widget/tooltip': (context) => const YZTooltipWidget(),
      '/widget/dataTable': (context) => const YZDataTableWidget(),
      '/widget/card': (context) => const YZCardWidget(),
      '/widget/progressIndicator': (context) =>
          const YZProgressIndicatorWidget(),
      '/widget/listTile': (context) => const YZListTileWidget(),
      '/widget/stepper': (context) => const YZStepperWidget(),
      '/widget/divider': (context) => const YZDividerWidget(),
      '/widget/cupertinoActivityIndicator': (context) =>
          const YZCupertinoActivityIndicatorWidget(),
      '/widget/cupertinoAlertDialog': (context) =>
          const YZCupertinoAlertDialogWidget(),
      '/widget/cupertinoTabScaffold': (context) =>
          const YZCupertinoTabScaffoldWidget(),
      '/widget/stack': (context) => const YZStackWidget(),
      '/widget/gridView': (context) => const YZGridViewWidget(),
      '/widget/customScrollView': (context) => const YZCustomScrollViewWidget(),
      '/widget/nestedScrollView': (context) => const YZNestedScrollViewWidget(),
      '/widget/sliverList': (context) => const YZSliverListWidget(),
      '/widget/sliverFixedExtentList': (context) =>
          const YZSliverFixedExtentListWidget(),
      '/widget/sliverGrid': (context) => const YZSliverGradWidget(),
      '/widget/sliverPadding': (context) => const YZSliverPaddingWidget(),
      '/widget/sliverAppBar': (context) => const YZSliverAppBarWidget(),
      '/widget/sliverPersistentHeader': (context) =>
          const YZSliverPersistentHeaderWidget(),
      '/widget/sliverToBoxAdapterWidget': (context) =>
          const YZSliverToBoxAdapterWidget(),
      '/widget/sliverFillViewport': (context) =>
          const YZSliverFillViewprotWidget(),
      '/widget/sliverFillRemaining': (context) =>
          const YZSliverFillRemainingWidget(),
      '/widget/intrinsic': (context) => const YZIntrinsicWidget(),
      '/widget/showAndHide': (context) => const YZShowAndHideWidget(),
      '/widget/box': (context) => const YZBoxWidget(),
      '/widget/transform': (context) => const YZTransformWidget(),
      '/widget/customSingleChildLayout': (context) =>
          const YZCustomSingleChildLayoutWidget(),
      '/widget/indexedStack': (context) => const YZIndexedStackWidget(),
      '/widget/flow': (context) => const YZFlowWidget(),
      '/widget/table': (context) => const YZTableWidget(),
      '/widget/wrap': (context) => const YZWrapWidget(),
      '/widget/listBody': (context) => const YZListBodyWidget(),
      '/widget/customMultiChildLayout': (context) =>
          const YZCustomMultiChildLayoutWidget(),
      '/widget/builder': (context) => const YZBuilderWidget(),
      '/widget/notificationListener': (context) =>
          const YZNotificationListenerWidget(),
      '/widget/draggableScrollable': (context) =>
          const YZDraggableScrollableWidget(),
      '/widget/draggable': (context) => const YZDraggableWidget(),
      '/widget/dragTarget': (context) => const YZDragTargetWidget(),
      '/widget/longPressDraggable': (context) =>
          const YZLongPressDraggableWidget(),
      '/widget/state': (context) => const YZPageStateWidget(),
    };
  }

  // 配置animation相关路由
  Map<String, WidgetBuilder> _getAnimationMap() {
    return {
      '/animation/painter': (context) => const YZPainterWidget(),
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
