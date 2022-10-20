import 'package:flutter/material.dart';

/// 步骤选择器
class YZStepperWidget extends StatefulWidget {
  const YZStepperWidget({Key? key}) : super(key: key);
  @override
  YZStepperWidgetState createState() => YZStepperWidgetState();
}

class YZStepperWidgetState extends State<YZStepperWidget> {
  int _currentStep = 0;
  List<YZStepperModel> _datas = [];

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    _datas.clear();

    _datas.add(YZStepperModel('第一步', '我们先进行第一步', 0));
    _datas.add(YZStepperModel('第二步', '我们先进行第二步', 1));
    _datas.add(YZStepperModel('第三步', '我们先进行第三步', 2));
    _datas.add(YZStepperModel('第四步', '我们先进行第四步', 3));
    _datas.add(YZStepperModel('第五步', '我们先进行第五步', 4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Stepper'),
      ),
      body: SafeArea(
        child: _listView(),
      ),
    );
  }

  ListView _listView() {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 1000.0,
            height: 200.0,
            child: _stepper(StepperType.horizontal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 30.0,
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text(' ----- < vertical stepper > -----'),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 400.0,
            height: 500.0,
            child: _stepper(StepperType.vertical),
          ),
        ),
      ],
    );
  }

  Stepper _stepper(StepperType type) {
    return Stepper(
      // <Step> 子控件数组
      steps: _steps(),
      // 滑动的物理效果
      physics: const ClampingScrollPhysics(),
      // StepperType 类型，分为横向与纵向两种，默认StepperType.vertical
      type: type,
      // 当前 step
      currentStep: _currentStep,
      // 内容下方按钮构建函数
      controlsBuilder: (context, details) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: details.onStepContinue,
              child: const Text('Next'),
            ),
            const Padding(padding: EdgeInsets.only(left: 15.0)),
            ElevatedButton(
              onPressed: details.onStepCancel,
              child: const Text('Cancel'),
            ),
            const Padding(padding: EdgeInsets.only(left: 15.0)),
            ElevatedButton(
              onPressed: () {
                print('button Click');
              },
              child: const Text('Click button'),
            ),
          ],
        );
      },
      // step 点击回调函数
      onStepTapped: (value) {
        _currentStep = value;
        setState(() {});
      },
      // Next 按钮点击回调函数
      onStepContinue: () {
        if (_currentStep < _datas.length - 1) {
          _currentStep++;
        }

        setState(() {});
      },
      // Cancel 按钮点击回调函数
      onStepCancel: () {
        if (_currentStep > 0) {
          _currentStep--;
        }

        setState(() {});
      },
    );
  }

  List<Step> _steps() {
    List<Step> steps = [];
    for (var model in _datas) {
      // 结点状态处理
      if (_currentStep < model.index) {
        // 未处理
        model.state = StepState.indexed;
      } else if (_currentStep == model.index) {
        model.state = StepState.editing;
      } else {
        // 已处理
        model.state = StepState.complete;
      }

      steps.add(Step(
        // 标题控件
        title: Row(children: [const Icon(Icons.title), Text(model.title)]),
        // 副标题控件
        subtitle: Text(model.content),
        // 内容控件
        content: Text(
          model.content,
        ),
        // 当前 step 的状态，StepState 会改变每一个 step 的图标，默认为 StepState.indexed
        state: model.state,
        // 是否激活状态，默认为 false，isActive == true 时会变成主题色
        isActive: (_currentStep == _datas.indexOf(model)),
      ));
    }
    return steps;
  }
}

class YZStepperModel extends Object {
  String title;
  String content;
  int index;
  // 当前 step 的状态，StepState 会改变每一个 step 的图标，默认为 StepState.indexed
  StepState state = StepState.indexed;

  YZStepperModel(this.title, this.content, this.index);
}
