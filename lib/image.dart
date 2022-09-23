// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class YZImageWidget extends StatelessWidget {
  const YZImageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.blue,
          title: const Text(
        "image",
      )),
      body: Container(
        color: Colors.white,
        child: _listView(),
      ),
    );
  }

  ListView _listView() {
    return ListView(
      padding: const EdgeInsets.all(15.0),
      children: [
        const Text("本地图片:"),
        SizedBox(
          height: 100.0,
          child: _localRow(),
        ),
        const Text("网络图片:"),
        Image.network(
            "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"),
        const Text("带占位图的网络图片，成功加载:"),
        FadeInImage.assetNetwork(
          placeholder: "assets/images/icon_phone.png",
          image:
              "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png",
          fit: BoxFit.fill,
        ),
        FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
                "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"),
        const Text("带占位图的网络图片，加载失败:"),
        Container(
          // width: 100.0,
          // height: 100.0,
          margin: const EdgeInsets.only(left: 300.0),
          // constraints: const BoxConstraints(maxWidth: 200.0),
          color: Colors.cyan,
          child: FadeInImage.assetNetwork(
            // 未记载完成时的展位图
            placeholder: 'assets/images/icon_phone.png',
            image: 'https://www.baidu.com/img/123.png',
            fit: BoxFit.fill,
            // TODO: 图片加载错误后展示的 widget
            imageErrorBuilder: (
              BuildContext context,
              Object error,
              StackTrace? stackTrace,
            ) {
              print("---图片加载错误---");
              return Image.asset('assets/images/icon_phone.png');
            },
          ),
        ),
        const FadeInImage(
          width: 100.0,
          height: 100.0,
          fadeOutDuration: Duration(seconds: 1),
          fadeOutCurve: Curves.easeOutQuad,
          fadeInDuration: Duration(seconds: 2),
          fadeInCurve: Curves.easeInQuad,
          placeholder: AssetImage(
            'assets/images/icon_phone.png',
          ),
          image: NetworkImage(
            'https://www.baidu.com/img/12345.png',
          ),
        ),
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fcf.png',
        ),
      ],
    );
  }

  Row _localRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _localContainer("assets/images/icon_phone.png"),
        _localContainer("assets/images/icon_pdf.png"),
        _localContainer("assets/images/icon_phone.png"),
        _localContainer("assets/images/icon_pdf.png"),
        _localContainer("assets/images/icon_pdf.png"),
      ],
    );
  }

  Container _localContainer(String image) {
    return Container(
      width: 32.0,
      height: 64.0,
      color: Colors.cyan,
      child: Image.asset(
        image,
        fit: BoxFit.none,
      ),
    );
  }
}
