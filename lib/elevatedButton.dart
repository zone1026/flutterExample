// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/src/material/material_state.dart';

/**
 * 状态按钮
 */
class YZElevatedButtonWidget extends StatefulWidget {
  const YZElevatedButtonWidget({Key? key}) : super(key: key);
  @override
  YZElevateButtonState createState() => YZElevateButtonState();
}

class YZElevateButtonState extends State<YZElevatedButtonWidget> {
  var btnEnabled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: const Text("title"),
      ),
      body: SafeArea(
        child: Container(
          child: _listView(),
        ),
      ),
    );
  }

  ListView _listView() {
    return ListView(
      padding: const EdgeInsets.all(15.0),
      children: [
        _button(),
        _shapeColum(),
        _statefulColumn(),
        _customColumn(),
      ],
    );
  }

  ElevatedButton _button() {
    return ElevatedButton(
        onPressed: () {
          print(' click');
        },
        onLongPress: () {
          print('long press');
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return Colors.red;
          }),
        ),
        child: const Text(
          "elevated button",
          style: TextStyle(color: Colors.white),
        ));
  }

  Column _shapeColum() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text('shape button'),
        ),
        ElevatedButton(
          // 使用ElevatedButton特定的style
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            // onPrimary: Colors.black,
            shape: const CircleBorder(
              side: BorderSide(
                  width: 2.0, color: Colors.green, style: BorderStyle.solid),
            ),
          ),
          onPressed: () {
            print('click');
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            alignment: Alignment.center,
            child: const Text(
              'Circle',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(15.0)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.blue,
            // StadiumBorder 高度的1/2值做切角
            shape: const StadiumBorder(
              side: BorderSide(
                width: 2.0,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
            ),
          ),
          onPressed: () {
            print('click');
          },
          child: Container(
            width: 200.0,
            height: 80.0,
            alignment: Alignment.center,
            child: const Text(
              '球场的',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(15.0)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: const BorderSide(
                width: 2.0,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
            ),
          ),
          // onPressed 设置为 null时按钮不可点击
          onPressed: () {
            print('click');
          },
          child: Container(
            width: 100.0,
            height: 30.0,
            alignment: Alignment.center,
            child: const Text(
              '球场的',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Column _statefulColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text('stateful button'),
        ),
        ElevatedButton(
          // 使用ElevatedButton特定的style
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            // onPrimary: Colors.black,
            shape: const CircleBorder(
              side: BorderSide(
                  width: 2.0, color: Colors.green, style: BorderStyle.solid),
            ),
          ),
          onPressed: btnEnabled == true
              ? () {
                  print('click');
                }
              : null,
          child: Container(
            width: 100.0,
            height: 100.0,
            alignment: Alignment.center,
            child: const Text(
              'Circle',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(15.0)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.blue,
            // StadiumBorder 高度的1/2值做切角
            shape: const StadiumBorder(
              side: BorderSide(
                width: 2.0,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
            ),
          ),
          onPressed: () {
            print('click');
            btnEnabled = !btnEnabled;
            setState(() {});
          },
          child: Container(
            width: 260.0,
            height: 80.0,
            alignment: Alignment.center,
            child: const Text(
              '点击控制上方圆形按钮是否被激活',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Column _customColumn() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15.0),
          alignment: Alignment.centerLeft,
          child: const Text('custom button'),
        ),
        const Padding(padding: EdgeInsets.all(8.0)),
        ElevatedButton(
          onPressed: () {
            print('click');
          },
          child: Container(
            height: 200.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.white,
                  child: const Icon(Icons.menu),
                  // child: Image.asset('assets/images/icon_phone.png'),
                  // child: Image.network(
                  //     'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'title',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'subtitle',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.red,
                      ),
                    )
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
