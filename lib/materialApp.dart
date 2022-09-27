// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZMaterialAppWidget extends StatelessWidget {
  const YZMaterialAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      // home: const Scaffold(
      //   body: YZMaterialAppBodyWidget(),
      // ),
      // 初始路由 initialRoute；路由必须在routes定义，否则会报错
      // TODO:此时可以不定义home，建议路由和home使用其中一种方式，两者同时定义时有可能会报错
      initialRoute: 'study',
      routes: {
        // 设置根路由，当初始路由异常时，会停留在(/)根路由。
        // TODO: 此时不可定义home否则会报错
        '/': (context) => const YZMaterialAppBodyWidget(),
        '/home': (context) => const YZMaterialAppHomeWidget(),
        '/study': (context) => const YZMaterialAppStudyWidget(),
        '/settings': (context) => const YZMaterialAppSettingsWidget(),
        '/pop': (context) => const YZMaterialAppPopWidget(),
      },
      // 触发了一个未定义的路由
      onUnknownRoute: (settings) {
        print('unknownRoute:$settings');
        return MaterialPageRoute(builder: (context) {
          return const YZMaterialAppBodyWidget();
        });
      },
      // 路由拦截
      onGenerateRoute: (settings) {
        print('generateRoute:$settings');
        return MaterialPageRoute(builder: (context) {
          return const YZMaterialAppBodyWidget();
        });
      },
      onGenerateInitialRoutes: (initialRoute) {
        return [
          MaterialPageRoute(builder: (context) {
            return const YZMaterialAppBodyWidget();
          })
        ];
      },
    );
  }
}

class YZMaterialAppBodyWidget extends StatelessWidget {
  const YZMaterialAppBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home', arguments: {
              'data': [1, 2, 3]
            });
          },
          child: const Text('Home'),
        ),
      ),
    );
  }
}

class YZMaterialAppHomeWidget extends StatelessWidget {
  const YZMaterialAppHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 上一个页面带的数据
    var value = ModalRoute.of(context)?.settings.arguments;
    print('上一个页面带过来参数了，${value}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialAppHome'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/study',
            );
          },
          child: const Text('Study'),
        ),
      ),
    );
  }
}

class YZMaterialAppStudyWidget extends StatelessWidget {
  const YZMaterialAppStudyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialAppStudy'),
      ),
      body: _listView(context),
    );
  }

  ListView _listView(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Navigator pop"),
          onTap: () async {
            // pop
            // 获取返回页面传递过来的数据
            // var value = Navigator.pushNamed(context, '/pop');
            // value.then(
            //   (value) => {
            //     print('pop value: $value'),
            //   },
            // );

            // 另一个获取返回页面传递过来的数据
            var valueOne = await Navigator.pushNamed(context, '/pop');
            print('pop value: $valueOne');
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: const Text("Navigator.pushNamed"),
          onTap: () {
            // push到/settings
            Navigator.pushNamed(context, '/settings');
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: const Text("Navigator.pushNamedAndRemoveUntil"),
          onTap: () {
            // push到/settings,移除settings和home之间的页面
            Navigator.pushNamedAndRemoveUntil(context, '/settings',
                (Route route) => route.settings.name == '/home');
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: const Text("Navigator.of(context).pushNamedAndRemoveUntil"),
          onTap: () {
            // push到/settings,移除settings和home之间的页面
            Navigator.of(context).pushNamedAndRemoveUntil(
                "/settings", (Route route) => route.settings.name == '/home');
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: const Text("Navigator.pushNamedAndRemoveUntil - current"),
          onTap: () {
            // push到/settings，并删除前边所有页面
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/settings', (route) => route.isCurrent);
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: const Text("Navigator.pushReplacementNamed"),
          onTap: () {
            // 与pushNamedAndRemoveUntil区别：
            // 假设我们的页面为 AAA->BBB->CCC->DDD->EEE->FFF，我们在 EEE 页面跳转到 FFF 并且 removeUntil('/BBB')， 那么我们的页面层级则会变成 AAA->BBB->FFF。
            // 而使用 pushReplacementNamed('/ddd')，则会变成 AAA->BBB->CCC->DDD->FFF。
            //
            // TODO: push到/settings后当前页面销毁
            Navigator.pushReplacementNamed(context, '/settings');
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: const Text("Navigator.of(context).pushReplacementNamed"),
          onTap: () {
            // push到/settings后当前页面销毁
            Navigator.of(context).pushReplacementNamed('/settings');
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: const Text("Navigator.pushReplacement"),
          onTap: () {
            // push到/settings后当前页面销毁
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const YZMaterialAppSettingsWidget();
                },
                settings: const RouteSettings(
                  name: '/settings',
                ),
              ),
            );
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: const Text("Navigator.of(context).pushReplacement"),
          onTap: () {
            // push到/settings后当前页面销毁
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return const YZMaterialAppSettingsWidget();
                },
                settings: const RouteSettings(
                  name: '/settings',
                ),
              ),
            );
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: const Text("Navigator.popAndPushNamed"),
          onTap: () {
            // 执行两个过程，先pop再push
            // 先 pop 一级，然后在 push 到对应页面
            Navigator.popAndPushNamed(context, '/settings');
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: const Text("Navigator.of(context).popAndPushNamed"),
          onTap: () {
            // 先 pop 一级，然后在 push 到对应页面
            Navigator.of(context).popAndPushNamed('/settings');
          },
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );
  }
}

class YZMaterialAppSettingsWidget extends StatelessWidget {
  const YZMaterialAppSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialAppSettings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 回到栈顶
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: const Text('Back First'),
        ),
      ),
    );
  }
}

class YZMaterialAppPopWidget extends StatelessWidget {
  const YZMaterialAppPopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialAppPop'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Navigator.pop'),
            onTap: () {
              Navigator.pop(context, {
                "data": ["1001", "1002", "1003"]
              });
            },
          ),
          ListTile(
            title: const Text('Navigator.of().pop'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Navigator.canPop'),
            onTap: () {
              // 是否可以 pop
              bool canPop = Navigator.canPop(context);
              if (canPop == true) {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            title: const Text('Navigator.maybePop'),
            onTap: () {
              // 先判断是否可以 pop，如果可以，在pop
              Navigator.maybePop(context);
            },
          ),
          ListTile(
            title: const Text('Navigator.popUntil'),
            onTap: () {
              // 回到指定页面
              Navigator.popUntil(
                  context, (route) => route.settings.name == '/home');
            },
          ),
        ],
      ),
    );
  }
}
