import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/card/not_found.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../../view/authenticate/test/view/test_view.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute? get instance => _instance ?? NavigationRoute._init();
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestView());

      default:
        return normalNavigate(const NotFoundWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
