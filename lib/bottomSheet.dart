// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZBottomSheetWidget extends StatelessWidget {
  const YZBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return _scaffold(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "BottomSheet",
        ),
      ),
      body: Center(
        child: _textButton(context),
      ),
      // bottomSheet: _bottomSheet(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('返回'),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }

  TextButton _textButton(BuildContext widgeContext) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.red)),
        onPressed: () {
          showModalBottomSheet(
            context: widgeContext,
            builder: (context) {
              return Container(
                width: 400.0,
                height: 300.0,
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "showModalBottomSheet",
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          );
        },
        child: const Text(
          'BottomSheet',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ));
  }

  BottomSheet _bottomSheet() {
    return BottomSheet(
      onClosing: () {
        print('close');
      },
      builder: (BuildContext context) {
        return Container(
          height: 300.0,
          color: Colors.yellow,
          alignment: Alignment.centerLeft,
          child: const Text('BottomSheet In Scaffold'),
        );
      },
    );
  }

  Scaffold _scaffold(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomSheet"),
      ),
      body: const Center(
        child: BottomSheetBtn(),
      ),
    );
  }
}

class BottomSheetBtn extends StatelessWidget {
  const BottomSheetBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("showBottomSheet"),
      onPressed: () {
        showBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              width: 414,
              height: 300,
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child: const Text(
                "showBottomSheet",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        );
      },
    );
  }
}
