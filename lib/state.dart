// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';

/// initState：State对象载入，可以在里面做一些数据初始化等
/// didChangeDependencies：当State对象的依赖发生变化时会被调用
/// build ：页面构建
/// reassemble：在热重载时调用，Release模式下不会被调用。
/// didUpdateWidget：页面重新build的时候会调用该方法。
/// deactivate：当State对象被移除时，会调用此回调。
/// dispose：当State对象被销毁时调用，通常在此回调中释放资源。

class YZPageStateWidget extends StatefulWidget {
  const YZPageStateWidget({Key? key}) : super(key: key);
  @override
  _YZPageState createState() => _YZPageState();
}

class _YZPageState extends State<YZPageStateWidget>
    with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('State'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(54.0),
          child: Material(
            color: Colors.white,
            child: TabBar(
              tabs: const [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                  iconMargin: EdgeInsets.only(bottom: 8.0),
                  height: 54.0,
                ),
                SizedOverflowBox(
                  size: Size(200.0, 50.0),
                  child: Tab(
                    icon: Icon(Icons.settings),
                    text: 'Settings',
                    iconMargin: EdgeInsets.only(bottom: 8.0),
                    // height: 54.0,
                  ),
                )
              ],
              // 是否可滚动，false时bar平分父容器宽度
              isScrollable: false,
              controller: controller,
              indicatorWeight: 5.0,
              indicatorColor: Colors.blue,
              onTap: (index) {
                // print('click index = $index');
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: const [
            _YZHomePageWidget(),
            _YZSettingPageWidget(),
          ],
        ),
      ),
    );
  }
}

class _YZHomePageWidget extends StatefulWidget {
  const _YZHomePageWidget({Key? key}) : super(key: key);
  @override
  _YZHomePageState createState() => _YZHomePageState();
}

/// 1、混入WidgetsBindingObserver，
/// 重写didChangeAppLifecycleState方法才能看到app进入前后台的状态
///
/// 2、混入AutomaticKeepAliveClientMixin，
/// build方法添加super.build(context)，重写wantKeepAlive返回true，解决页面被重载的问题
///
class _YZHomePageState extends State<_YZHomePageWidget>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  var _count = 0;
  @override
  void initState() {
    print('HomePage initState');
    super.initState();
    // 绑定widget观察者
    WidgetsBinding.instance.addObserver(this);
    // 初始化数据
    initData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('HomePage didChangeDependencies');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('HomePage deactivate');
  }

  @override
  void didUpdateWidget(covariant _YZHomePageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('HomePage didUpdateWidget');
  }

  @override
  void dispose() {
    // 解绑widget观察者
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    print('HomePage dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('HomePage reassemble');
  }

  @override
  // ignore: unnecessary_overrides
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // app进入前后台的状态
    super.didChangeAppLifecycleState(state);
    print('HomePage didChangeAppLifecycleState $state');
  }

  // 初始化数据
  void initData() {}
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('HomePage build');
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Colors.red,
        child: Column(
          children: [
            const Text('Home'),
            Text('num: $_count'),
            ElevatedButton(
              onPressed: () {
                _count++;
                setState(() {});
              },
              child: const Text('num++'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/widget/state');
              },
              child: const Text('next page'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text('update page'),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _YZSettingPageWidget extends StatefulWidget {
  const _YZSettingPageWidget({Key? key}) : super(key: key);
  @override
  _YZSettingPageState createState() => _YZSettingPageState();
}

class _YZSettingPageState extends State<_YZSettingPageWidget> {
  @override
  void initState() {
    print('SettingPage initState');
    super.initState();
    // 初始化数据
    initData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('SettingPage didChangeDependencies');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('SettingPage deactivate');
  }

  @override
  void didUpdateWidget(covariant _YZSettingPageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('SettingPage didUpdateWidget');
  }

  @override
  void dispose() {
    super.dispose();
    print('SettingPage dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('SettingPage reassemble');
  }

  // 初始化数据
  void initData() {}
  @override
  Widget build(BuildContext context) {
    print('SettingPage build');
    return Container(
      color: Colors.green,
    );
  }
}
