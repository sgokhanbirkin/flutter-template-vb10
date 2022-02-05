import 'package:flutter_template_vb10/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_template_vb10/core/init/lang/locale_keys.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();
  static LocaleManager? get instance => _instance;
  late SharedPreferences _preferences;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  // static preferencesInıt() async {
  //   if(instance!._preferences == null) {
  //     SharedPreferences.getInstance().then((value) {
  //       _instance._preferences = value;
  //     });
  //   }
  // }

  void setStringValue(PreferencesKeys key, String? value) {
    _preferences.setString(key.toString(), value!);
  }

  String? getStringValue(PreferencesKeys key) =>
      _preferences.getString(key.toString());
}
