import 'package:flutter/material.dart';
import 'package:flutter_template_vb10/core/base/view/base_view.dart';
import 'package:flutter_template_vb10/core/extension/context_extension.dart';
import 'package:flutter_template_vb10/view/authenticate/login/view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) =>
          buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        body: ListView(children: [
          Container(
            padding: context.paddingLow,
            height: context.height * 0.5,
            color: context.colors.background,
            child: buildText(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.lowValue),
            child: const Placeholder(),
          ),
        ]),
      );
  Text buildText(context) {
    return Text(
      "Hello",
      style: context.textTheme.headline1,
    );
  }
}
