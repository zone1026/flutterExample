// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

/// SliverAppBar 和 AppBar差不多，但是支持滚动折叠的效果
class YZSliverAppBarWidget extends StatefulWidget {
  const YZSliverAppBarWidget({Key? key}) : super(key: key);
  @override
  _YZSliverAppBarWidgetState createState() => _YZSliverAppBarWidgetState();
}

class _YZSliverAppBarWidgetState extends State<YZSliverAppBarWidget>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            // 在标题前面显示的一个控件
            // leading: const Icon(Icons.favorite),
            // 标题文字
            title: const Text('SliverAppBar'),
            // 标题是否居中显示
            centerTitle: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(44.0),
              child: Material(
                color: Colors.white,
                child: TabBar(
                  tabs: const [
                    Tab(
                      text: 'One',
                    ),
                    Tab(
                      text: 'Two',
                    ),
                    Tab(
                      text: 'Three',
                    ),
                  ],
                  controller: controller,
                  labelStyle: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.red,
                ),
              ),
            ),
            // 展开高度
            expandedHeight: 320.0,
            // 折叠高度，不设置的话会折叠到SliverAppBar高度
            collapsedHeight: 64.0,
            // true时下滑先展示SliverAppBar，展示完成后才展示其他滑动组件内容
            floating: false,
            // SliverAppBar收缩到最小高度的时候SliverAppBar是否可见，
            // true：SliverAppBar会以折叠高度固定显示在头部，
            // false：缩小到折叠高度后滑出页面
            pinned: true,
            // snap为true，floating也要为true才会有效果。
            // true的时候会监听你的手势结束时的动作时是下滑，那么SliverAppBar展开，上滑则是收缩折叠至上一次折叠的位置处，
            // 但是这个效果需要一个基础就是存在上一次折叠的位置，否则不生效
            snap: false,
            // true：SliverAppBar完全展开后是否可以继续拉伸，
            // 注意这个需要外部滑动组件physics的支持（设置BouncingScrollPhysics()，滑动到标界可以继续滑动拥有回弹效果），否则是不会生效的
            stretch: true,
            // 拉伸监听触发的偏移
            stretchTriggerOffset: 100.0,
            // onStretchTrigger: () {
            //   return '';
            //   print('onStretchTrigger');
            // },
            // FlexibleSpaceBar 这里就是用于实现滚动折叠的效果的地方
            flexibleSpace: FlexibleSpaceBar(
              // 标题
              // title: const Text('FlexibleSpaceBar title'),
              // widget 背景
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(Constants.imageUlr),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'FlexibleSpaceBar background content',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              // 标题是否居中
              centerTitle: false,
              // 标题内边距
              titlePadding: const EdgeInsets.all(0),
              // 折叠模式
              // CollapseMode.none：背景不跟随滚动
              // CollapseMode.parallax：背景跟随滚动但是具有滚动视差效果
              // CollapseMode.pin：背景完全随着滚动
              collapseMode: CollapseMode.pin,
              // 拉伸模式
              // zoomBackground：背景小部件将展开以填充额外的空间
              // blurBackground：使用[ImageFilter.blur]效果，背景将模糊
              // fadeTitle：随着用户过度滚动，FlexibleSpaceBar标题将消失
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 2.0)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 64.0,
                  color: Colors.primaries[index % Colors.primaries.length],
                  alignment: Alignment.center,
                  child: Text('index = $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
