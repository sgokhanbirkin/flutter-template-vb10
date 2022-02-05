import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_vb10/core/init/notifier/provider_list.dart';
import 'package:flutter_template_vb10/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'view/authenticate/test/view/test_view.dart';

void main() {
  runApp(EasyLocalization(
    child: const MyApp(),
    path: ApplicationConstants.LANG_ASSET_PATH,
    supportedLocales: LanguageManager.instance!.supportedLocales,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...ApplicationProvider.instance!.singleItems,
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
        home: const TestView(),
      ),
    );
  }
}
