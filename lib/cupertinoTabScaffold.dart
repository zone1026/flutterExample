import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// CupertinoTabScaffold、CupertinoTabView、CupertinoTabBar 是 iOS 风格的 UITabBarController 中的相关组件
class YZCupertinoTabScaffoldWidget extends StatefulWidget {
  const YZCupertinoTabScaffoldWidget({Key? key}) : super(key: key);
  @override
  YZCupertinoTabScaffoldWidgetState createState() =>
      YZCupertinoTabScaffoldWidgetState();
}

class YZCupertinoTabScaffoldWidgetState
    extends State<YZCupertinoTabScaffoldWidget> {
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
    return CupertinoTabScaffold(
      tabBar: _cupertinoTabBar(),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return const YZTabMusicWidget();
              case 1:
                return const YZTabVideoWidget();
              case 2:
                return const YZTabChatWidget();
              default:
                return Container();
            }
          },
          routes: {
            '/tab/music': (context) => const YZTabMusicWidget(),
            '/tab/video': (context) => const YZTabVideoWidget(),
            '/tab/chat': (context) => const YZTabChatWidget(),
          },
        );
      },
    );
  }

  CupertinoTabBar _cupertinoTabBar() {
    return CupertinoTabBar(
      items: [
        _bottomNavigationBarItem(Icons.music_note, 'music'),
        _bottomNavigationBarItem(Icons.video_camera_back, 'video'),
        _bottomNavigationBarItem(Icons.chat, 'chat')
      ],
      currentIndex: 1,
      backgroundColor: Colors.yellow,
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
      border: const Border(top: BorderSide(color: Colors.red, width: 3.0)),
      onTap: (value) {},
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData iconData, String title) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: title,
      activeIcon: Icon(iconData),
    );
  }
}

class YZTabMusicWidget extends StatelessWidget {
  const YZTabMusicWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Music',
          style: TextStyle(
            color: Colors.red,
            fontSize: 30.0,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Music',
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ),
    );
  }
}

class YZTabVideoWidget extends StatelessWidget {
  const YZTabVideoWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        middle: Text(
          'Video',
          style: TextStyle(
            color: Colors.red,
            fontSize: 30.0,
          ),
        ),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text(
            'Goto Music ->',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              decoration: TextDecoration.none,
            ),
          ),
          onPressed: () {
            // hidesBottomBarWhenPushed
            Navigator.of(context, rootNavigator: true)
                .push(CupertinoPageRoute(builder: (context) {
              return const YZTabMusicWidget();
            }));
          },
        ),
      ),
    );
  }
}

class YZTabChatWidget extends StatelessWidget {
  const YZTabChatWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
        ),
      ),
      body: Center(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.red),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) {
                  return const YZTabChatWidget();
                },
              ),
            );
          },
          child: const Text('Goto Music ->'),
        ),
      ),
    );
  }
}
