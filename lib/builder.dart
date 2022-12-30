// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class YZStatelessWidget extends StatelessWidget {
  const YZStatelessWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Title',
        ),
      ),
      body: Container(),
    );
  }
}
