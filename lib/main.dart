// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:my_app/home.dart';

void main() {
  runApp(const MyHomeApp());
  // runApp(const MyApp());
  /**runApp(
    // const MaterialApp(
    //   title: 'My App',
    //   home: SafeArea(child: MyScaffold()),
    //   // home: MyScaffold(),Ø
    // ),
    const GetMaterialApp(
      title: 'my app',
      // home: SafeArea(child: MyScaffold()),
      home: MyScaffold(),
      color: Colors.blue,
    ),
  );*/
}

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 关闭条幅上的DEBUG字样
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const YZHomeVc(),
    );
  }
}

Color _getRandomColor() {
  return Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1.0);
}

List<Widget> _actions() {
  return [
    Container(
      width: 50,
      color: Colors.red,
      child: const Icon(Icons.image),
    ),
    Container(
      width: 50,
      color: Colors.green,
      child: const Icon(Icons.accessible),
    ),
    Container(
      width: 50,
      color: Colors.blue,
      child: const Icon(Icons.backspace),
    ),
  ];
}

Container _leading() {
  return Container(
    width: 50.0,
    color: Colors.red,
    child: const Icon(Icons.arrow_back_ios),
  );
}

IconThemeData _iconThemeData() {
  return const IconThemeData(
    color: Colors.red,
    size: 32.0,
    // opacity: 0.6,
  );
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          // MyAppBar(
          //     title: Text(
          //   'Example title',
          //   style: Theme.of(context).primaryTextTheme.headline6,
          // )),
          AppBar(
            title: const Text(
              "Example title",
              style: TextStyle(color: Colors.cyan),
            ),
            backgroundColor: _getRandomColor(),
            foregroundColor: _getRandomColor(),
            shadowColor: _getRandomColor(),
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light),
            centerTitle: false,
            titleSpacing: 15,
            automaticallyImplyLeading: true,
            leading: _leading(),
            actions: _actions(),
            // toolbarHeight: 64.0,
            toolbarOpacity: 0.5,
            // iconTheme: _iconThemeData(),
            // actionsIconTheme: _iconThemeData(),
          ),
          const Expanded(
            child: Center(
              child: Text('Hello, world!!!'),
            ),
          ),
          Container(
            height: 120,
            width: 120.0,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              print("menu");
            },
            icon: const Icon(Icons.menu),
          ),
          Expanded(child: title),
          IconButton(
            onPressed: () {
              print("search");
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
