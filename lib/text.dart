// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class YZTextWidget extends StatelessWidget {
  const YZTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.blue,
          title: const Text(
        "Text",
      )),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 34.0),
        child: _listView(),
      ),
    );
  }

  ListView _listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 15.0,
        left: 15.0,
        right: 15.0,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        if (index % 2 == 0) {
          return _normalText(index);
        } else {
          return _richText(index);
        }
      },
    );
  }

  Container _normalText(int index) {
    return Container(
      // padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      // margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      decoration: const BoxDecoration(
        // color: Colors.cyan,
        // border: Border.all(width: 5.0),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Text(
            "hello, world hello, worldhello, worldhello, worldhello, worldhello, worldhello, worldhello, worldhello, worldhello, world",
            textAlign: TextAlign.left,
            softWrap: true,
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.cyan,
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.dotted,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
          ),
          Divider(
            color: Colors.red,
            height: 0.5,
            thickness: 0.5,
            // endIndent: 8.0,
          ),
        ],
      ), // color: Colors.grey,
      // child: const
    );
  }

  Container _richText(int index) {
    return Container(
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Text.rich(
            TextSpan(
              text: "this is a rich text: ",
              style: const TextStyle(
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: "hello, world",
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.cyan,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('点击了第$index个');
                    },
                ),
                const TextSpan(
                  text: " you want try click?",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
          ),
          const Divider(
            color: Colors.red,
            height: 0.5,
            thickness: 0.5,
            // endIndent: 8.0,
          ),
        ],
      ),
    );
  }
}
