import 'package:get/get.dart';

import 'common/services/storage_service.dart';
import 'common/services/theme_service.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();

  Future<AppService> init() async {
    await Get.putAsync(() => StorageService().init()).then((value) {
      Get.putAsync(() => ThemeService().init());
    });
    return this;
  }
}
