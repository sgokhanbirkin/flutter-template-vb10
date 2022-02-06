import 'package:flutter/material.dart';
import 'package:flutter_template_vb10/core/base/model/base_view_model.dart';
import 'package:flutter_template_vb10/core/constants/enums/http_request_enum.dart';
import 'package:flutter_template_vb10/view/authenticate/test/model/test_model.dart';
import '../../../../core/constants/enums/app_themes_enum.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  @observable
  int number = 0;

  @observable
  bool isLoading = false;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context!, listen: false)
        .changeValue(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    final response = await coreDio!.send<List<TestModel>, TestModel>('x',
        type: HttpTypes.GET, parseModel: TestModel());
    if (response.data is List<TestModel>) {
    } else {}
    isLoading = false;
  }
}
