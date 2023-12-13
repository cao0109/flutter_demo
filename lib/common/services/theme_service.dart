import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../theme/app_theme.dart';
import 'storage_service.dart';

class ThemeService extends GetxService {
  static ThemeService get to => Get.find();

  Future<ThemeService> init() async {
    debugPrint('ThemeService init');
    appTheme = StorageService.to.getValue('appTheme') ??
        (Get.isDarkMode ? AppTheme.dark : AppTheme.light);
    followSystem = StorageService.to.getValue('followSystem') ?? true;
    changeTheme(appTheme);
    return this;
  }

  //theme
  final _appTheme = ''.obs;
  String get appTheme => _appTheme.value;
  set appTheme(String value) => _appTheme.value = value;

  //theme follow system
  final _followSystem = true.obs;
  bool get followSystem => _followSystem.value;
  set followSystem(bool value) => _followSystem.value = value;

  //themeData
  final themes = [
    AppTheme(
      AppTheme.system,
      Get.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
    ),
    AppTheme(AppTheme.light, AppTheme.lightTheme),
    AppTheme(AppTheme.dark, AppTheme.darkTheme),
    AppTheme(AppTheme.warm, AppTheme.warmTheme),
  ].obs;

  //change theme
  void changeTheme(String key) {
    appTheme = key;
    switch (key) {
      case AppTheme.system:
        _changeThemeAndMode(_getThemeData(AppTheme.system), ThemeMode.system);
        break;
      case AppTheme.light:
        _changeThemeAndMode(_getThemeData(AppTheme.light), ThemeMode.light);
        break;
      case AppTheme.dark:
        _changeThemeAndMode(_getThemeData(AppTheme.dark), ThemeMode.dark);
        break;
      case AppTheme.warm:
        _changeThemeAndMode(_getThemeData(AppTheme.warm), ThemeMode.light);
        break;
    }
    StorageService.to.setValue('appTheme', appTheme);
  }

  //follow system
  void followSystemChange(bool value) {
    followSystem = value;
    StorageService.to.setValue('followSystem', followSystem);
    if (followSystem) {
      appTheme = AppTheme.system;
    } else {
      final systemBrightness = Get.mediaQuery.platformBrightness;
      appTheme =
          systemBrightness == Brightness.dark ? AppTheme.dark : AppTheme.light;
    }
    changeTheme(appTheme);
  }

  //get themeData
  ThemeData _getThemeData(String key) {
    return themes.firstWhere((element) => element.key == key).theme;
  }

  //change theme and mode
  void _changeThemeAndMode(ThemeData theme, ThemeMode mode) {
    Get.changeTheme(theme);
    Get.changeThemeMode(mode);
  }
}
