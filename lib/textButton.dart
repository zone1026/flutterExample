// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZTextButtonWidget extends StatefulWidget {
  const YZTextButtonWidget({Key? key}) : super(key: key);
  @override
  YZTextButtonState createState() => YZTextButtonState();
}

class YZTextButtonState extends State<YZTextButtonWidget> {
  var btnEnabled = true;

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("TextButton"),
      ),
      body: SafeArea(
        child: _listView(),
      ),
    );
  }

  ListView _listView() {
    return ListView(
      padding: const EdgeInsets.all(15.0),
      children: [
        _normalButton(),
        _shapeButton(),
        _statefulButton(),
        _customButton()
      ],
    );
  }

  TextButton _normalButton() {
    return TextButton(
      onPressed: () {
        print('click text button');
      },
      onLongPress: () {
        print('long press text button');
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.blue),
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
      ),
      child: const Text('TextButton'),
    );
  }

  Column _shapeButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.only(top: 8.0, bottom: 8.0)),
        Container(
          height: 30.0,
          alignment: Alignment.centerLeft,
          child: const Text('shapeButton'),
        ),
        TextButton(
          onPressed: () {
            print('click text button');
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.green),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
            shape: MaterialStateProperty.resolveWith(
              (states) => const CircleBorder(
                side: BorderSide(
                    color: Colors.red, width: 2.0, style: BorderStyle.solid),
              ),
            ),
          ),
          child: Container(
            width: 100.0,
            height: 100.0,
            alignment: Alignment.center,
            child: const Text('Circle'),
          ),
        ),
        const Padding(padding: EdgeInsets.all(15.0)),
        TextButton(
          onPressed: () {
            print('click text button');
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.green),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
            shape: MaterialStateProperty.resolveWith(
              (states) => const StadiumBorder(
                side: BorderSide(
                    color: Colors.blue, width: 2.0, style: BorderStyle.solid),
              ),
            ),
          ),
          child: Container(
            width: 200.0,
            height: 50.0,
            alignment: Alignment.center,
            child: const Text('Circle'),
          ),
        ),
        const Padding(padding: EdgeInsets.all(15.0)),
        TextButton(
          onPressed: () {
            print('click text button');
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.green),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
            shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.red, width: 2.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          child: Container(
            width: 200.0,
            height: 50.0,
            alignment: Alignment.center,
            child: const Text('Circle'),
          ),
        ),
      ],
    );
  }

  Column _statefulButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.only(top: 8.0, bottom: 8.0)),
        Container(
          alignment: Alignment.centerLeft,
          height: 30.0,
          child: const Text('stateful button'),
        ),
        TextButton(
          onPressed: btnEnabled == true
              ? () {
                  print('click text button');
                }
              : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => (btnEnabled == true ? Colors.green : Colors.grey)),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
            overlayColor:
                MaterialStateProperty.resolveWith((states) => Colors.red),
            shape: MaterialStateProperty.resolveWith(
              (states) => const CircleBorder(
                side: BorderSide(
                    color: Colors.red, width: 2.0, style: BorderStyle.solid),
              ),
            ),
          ),
          child: Container(
            width: 100.0,
            height: 100.0,
            alignment: Alignment.center,
            child: const Text('Circle'),
          ),
        ),
        const Padding(padding: EdgeInsets.all(15.0)),
        TextButton(
          onPressed: () {
            btnEnabled = !btnEnabled;
            setState(() {});
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.green),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
            shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.red, width: 2.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          child: Container(
            width: 300.0,
            height: 50.0,
            alignment: Alignment.center,
            child: const Text('点击控制上方圆形按钮是否被激活'),
          ),
        ),
      ],
    );
  }

  Column _customButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.all(8.0)),
        Container(
          alignment: Alignment.centerLeft,
          height: 30.0,
          child: const Text('custom button'),
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            height: 200.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'))),
            child: Row(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.green,
                  child: Image.network(
                      'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'title',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                    Text(
                      'subTitle',
                      style: TextStyle(fontSize: 13.0, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
