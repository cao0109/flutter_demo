import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../../../common/api/post.dart';

class HomeIndexController extends GetxController {
  PostApi clerk = Get.put(PostApi());

  RxString htmlData = "".obs;

  void getPosts() async {
    var response = await clerk.getPosts();
    debugPrint(response.bodyString);
  }
}
