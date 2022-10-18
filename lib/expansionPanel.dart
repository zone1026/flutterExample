import 'package:flutter/material.dart';

/// 折叠框
class YZExpansionPanelWidget extends StatefulWidget {
  const YZExpansionPanelWidget({Key? key}) : super(key: key);
  @override
  YZExpansionPanelWidgetState createState() => YZExpansionPanelWidgetState();
}

class YZExpansionPanelWidgetState extends State<YZExpansionPanelWidget> {
  List<YZExpansionPanelModel> _models = [];
  List<ExpansionPanel> _childrenForExpansionPanel = [];
  List<ExpansionPanelRadio> _childrenForExpansionPanelRadio = [];

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    _models.clear();
    _models.add(YZExpansionPanelModel('value1', 'value1-title', false));
    _models.add(YZExpansionPanelModel('value2', 'value2-title', true));
    _models.add(YZExpansionPanelModel('value3', 'value3-title', false));
    _models.add(YZExpansionPanelModel('value4', 'value4-title', false));
    _models.add(YZExpansionPanelModel('value5', 'value5-title', true));
    _models.add(YZExpansionPanelModel('value6', 'value6-title', false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: const Text("ExpansionPanel"),
      ),
      body: SingleChildScrollView(
        // child: _expansionPanelList(),
        child: _expansionPanelListRadio(),
      ),
    );
  }

  // ***************** ExpansionPanel Method ***************** //

  ExpansionPanelList _expansionPanelList() {
    _initChildrenForExpansionPanel();

    return ExpansionPanelList(
      // 点击折叠收起回调函数，(panelIndex, isExpand){}，返回当前下标以及是否折叠
      expansionCallback: (panelIndex, isExpanded) {
        _models[panelIndex].expanded = !_models[panelIndex].expanded;
        setState(() {});
      },
      // 分割线颜色
      dividerColor: Colors.black,
      // 展开后 Header 的 padding，默认为 _kPanelHeaderExpandedDefaultPadding
      expandedHeaderPadding: EdgeInsets.zero,
      // 子控件数组，类型为 <ExpansionPanel> 的数组
      children: _childrenForExpansionPanel,
    );
  }

  void _initChildrenForExpansionPanel() {
    _childrenForExpansionPanel.clear();
    for (var model in _models) {
      _childrenForExpansionPanel.add(_expansionPanel(model));
    }
  }

  // 同时可以有个panel被展开
  ExpansionPanel _expansionPanel(YZExpansionPanelModel model) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return Container(
          height: 44.0,
          alignment: Alignment.centerLeft,
          child: Text(
            model.title,
          ),
        );
      },
      // 是否展开，默认为 false
      isExpanded: model.expanded,
      // 是否可以点击 header 用来展开收起，false
      canTapOnHeader: true,
      // panel背景颜色
      backgroundColor: Colors.orange,
      // 展开部分 Widget
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: 88.0,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                '${model.title} subTitle',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ***************** ExpansionPanel Method ***************** //

  ExpansionPanelList _expansionPanelListRadio() {
    _initChildrenForExpansionPanelRadio();
    return ExpansionPanelList.radio(
      expansionCallback: (panelIndex, isExpanded) {
        _models[panelIndex].expanded = !_models[panelIndex].expanded;
        setState(() {});
      },
      dividerColor: Colors.green,
      expandedHeaderPadding: EdgeInsets.zero,
      initialOpenPanelValue: _models[2].value,
      children: _childrenForExpansionPanelRadio,
    );
  }

  void _initChildrenForExpansionPanelRadio() {
    _childrenForExpansionPanelRadio.clear();
    for (var model in _models) {
      _childrenForExpansionPanelRadio.add(_expansionPanelRadio(model));
    }
  }

  // 同时只能有一个panel被展开
  ExpansionPanelRadio _expansionPanelRadio(YZExpansionPanelModel model) {
    return ExpansionPanelRadio(
      value: model.value,
      headerBuilder: (context, isExpanded) {
        return Container(
          height: 80.0,
          alignment: Alignment.centerLeft,
          child: Text(model.title),
        );
      },
      canTapOnHeader: true,
      backgroundColor: Colors.pink,
      body: Container(
        height: 20.0,
        color: Colors.blue,
      ),
    );
  }
}

class YZExpansionPanelModel extends Object {
  var value;
  String title;
  bool expanded;

  YZExpansionPanelModel(this.value, this.title, this.expanded);
}
