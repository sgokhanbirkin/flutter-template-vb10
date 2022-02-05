import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_template_vb10/core/base/state/base_state.dart';
import 'package:flutter_template_vb10/core/base/view/base_view.dart';
import 'package:flutter_template_vb10/view/authenticate/test/view_model/test_view_model.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: AppBar(
          title: const Text('TestView'),
        ),
        floatingActionButton: floatingActionButtonNumber,
        body: Column(
          children: [
            Center(
              child: textNumber,
            ),
          ],
        ),
      );

  Widget get textNumber {
    return Observer(
      builder: (context) => Text(
        viewModel.number.toString(),
      ),
    );
  }

  FloatingActionButton get floatingActionButtonNumber {
    return FloatingActionButton(
      onPressed: () => viewModel.incrementNumber(),
    );
  }
}
