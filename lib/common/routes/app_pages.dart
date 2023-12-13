import 'package:get/get.dart';

import '../../pages/post/post_detail/post_detail_view.dart';
import '../../pages/system/main/main_binding.dart';
import '../../pages/system/main/main_view.dart';
import '../../pages/system/setting/setting_view.dart';

part 'app_routes.dart';
// ignore_for_file: constant_identifier_names

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    //Setting
    GetPage(name: _Paths.SETTING, page: () => const SettingView()),
    GetPage(name: _Paths.POST_DETAIL, page: () => const PostDetailView()),
  ];
}
