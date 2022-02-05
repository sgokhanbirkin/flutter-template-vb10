import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../view_model/test_view_model.dart';

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
          title: const TextWelcomeWidget(),
          actions: [IconButtonChangeTheme(context: context)],
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

class IconButtonChangeTheme extends StatelessWidget {
  const IconButtonChangeTheme({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          // context.locale = LanguageManager.instance!.enLocale;
          context.setLocale(LanguageManager.instance!.enLocale);
        },
        icon: const Icon(Icons.change_history));
  }
}

class TextWelcomeWidget extends StatelessWidget {
  const TextWelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(LocaleKeys.welcome.locale);
  }
}
