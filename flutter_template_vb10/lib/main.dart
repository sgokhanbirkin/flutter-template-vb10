import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_vb10/core/init/cache/locale_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'view/authenticate/test/view/test_view.dart';

void main() {
  LocaleManager.instance;
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance!.dependItems],
    child: EasyLocalization(
      child: const MyApp(),
      path: ApplicationConstants.LANG_ASSET_PATH,
      supportedLocales: LanguageManager.instance!.supportedLocales,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: const TestView(),
      onGenerateRoute: NavigationRoute.instance?.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
