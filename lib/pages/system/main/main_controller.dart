import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../home/home_index/home_index_view.dart';
import '../../my/profile/profile_view.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Widget> pages = [const HomeIndexView(), const ProfileView()];

  void changePage(int value) {
    currentIndex.value = value;
  }
}
