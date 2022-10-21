// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZBottomNavigationBarWidget extends StatefulWidget {
  const YZBottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  YZBottomNavigationBarState createState() => YZBottomNavigationBarState();
}

class YZBottomNavigationBarState extends State<YZBottomNavigationBarWidget> {
  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar')),
      bottomNavigationBar: _bottomNavigationBar(),
      body: PageView(
        controller: pageController,
        children: [
          Container(),
          YZBottomNavigationBarPushWidget(),
          YZBottomNavigationBarPushWidget()
        ],
      ),
    );
  }

  var _selectedIndex = 0;
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'settings',
        ),
      ],
      onTap: (int index) {
        print('select item index $index');
        pageController.jumpToPage(index);
        _selectedIndex = index;
        setState(() {});
      },
      currentIndex: _selectedIndex,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.red,
      unselectedLabelStyle: const TextStyle(
        color: Colors.yellow,
        fontSize: 15.0,
      ),
      selectedLabelStyle: const TextStyle(
        color: Colors.cyan,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      unselectedIconTheme: const IconThemeData(color: Colors.black),
      selectedIconTheme: const IconThemeData(color: Colors.red),
      type: BottomNavigationBarType.fixed,
      iconSize: 44.0,
      // showUnselectedLabels: true,
      // showSelectedLabels: false,
    );
  }
}

class YZBottomNavigationBarPushWidget extends StatelessWidget {
  YZBottomNavigationBarPushWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YZBottomNavigationBarPushWidget',
        ),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
