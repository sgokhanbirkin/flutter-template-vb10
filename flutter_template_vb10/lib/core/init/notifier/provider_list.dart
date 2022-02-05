import 'package:flutter_template_vb10/core/init/navigation/navigation_service.dart';
import 'package:flutter_template_vb10/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider? get instance =>
      _instance ?? ApplicationProvider._init();
  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
    Provider.value(value: NavigationService.instance),
  ];

  List<SingleChildWidget> uiChangesItems = [];
}
