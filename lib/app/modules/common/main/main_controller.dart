import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Widget> pages = [
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Profile'),
    ),
  ];

  void changePage(int value) {
    currentIndex.value = value;
  }
}
