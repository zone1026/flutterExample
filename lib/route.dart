// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_app/routeManager.dart';

class YZRouteAppWidget extends StatelessWidget {
  const YZRouteAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YZRouteManager manager = YZRouteManager();
    return MaterialApp(
      title: 'Route',
      theme: ThemeData(primarySwatch: Colors.yellow),
      // home: const YZRouteHomeWidget(),
      initialRoute: '/',
      routes: manager.routeMap,
      onGenerateRoute: (settings) {
        return manager.routeWithSetting(settings);
      },
      // 触发了一个未定义的路由
      onUnknownRoute: (settings) {
        return manager.unknowRouteWithSetting(settings);
      },
    );
  }
}

class YZRouteHomeWidget extends StatefulWidget {
  const YZRouteHomeWidget({Key? key}) : super(key: key);

  @override
  YZRouteHomeState createState() => YZRouteHomeState();
}

class YZRouteHomeState extends State<YZRouteHomeWidget> {
  var pageData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Route",
        ),
      ),
      body: Container(
        color: Colors.white,
        child: _listView(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    YZRouteManager manager = YZRouteManager();
    for (var name in manager.routeMap.keys) {
      pageData.add(name);
    }

    setState(() {});
  }

  ListView _listView() {
    return ListView.separated(
      itemCount: pageData.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 0.5,
          color: Colors.grey,
          indent: 15.0,
          endIndent: 15.0,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(pageData[index]),
          onTap: () {
            var routeName = pageData[index];
            print('$routeName');
            Navigator.of(context).pushNamed(routeName);
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        );
      },
    );
  }
}
