import 'package:flutter/material.dart';
import 'package:flutter_template_vb10/core/base/view/base_view.dart';
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
          const Scaffold(),
    );
  }
}
