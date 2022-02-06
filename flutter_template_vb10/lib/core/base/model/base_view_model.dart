import 'package:flutter/material.dart';
import 'package:flutter_template_vb10/core/init/cache/locale_manager.dart';
import 'package:flutter_template_vb10/core/init/navigation/navigation_service.dart';
import 'package:flutter_template_vb10/core/init/network/ICoreDio.dart';
import 'package:flutter_template_vb10/core/init/network/network_manager.dart';
import 'package:flutter_template_vb10/core/init/network/vexana_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;

  ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;
  VexanaManager? vexanaManager = VexanaManager.instance;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
