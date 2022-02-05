import 'package:flutter/cupertino.dart';
import 'INavigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService? get instance => _instance;
  NavigationService._init();

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  get removeAllOldRoutes => (Route<dynamic> route) => false;
  @override
  Future<void> navigateToPage(String path, Object? arguments) async {
    await navigationKey.currentState?.pushNamed(
      path,
      arguments: arguments,
    );
  }

  @override
  Future<void> navigateToPageClear(String path, Object? arguments) async {
    await navigationKey.currentState?.pushNamedAndRemoveUntil(
      path,
      removeAllOldRoutes,
      arguments: arguments,
    );
  }
}
