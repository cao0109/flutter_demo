import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/routes/app_pages.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ListView(
      children: const [
        //user info
        ListTile(
          leading: Icon(Icons.person),
          title: Text("user info"),
          subtitle: Text("user info"),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      id: "profile",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("profile"),
            centerTitle: true,
            actions: [
              //setting
              IconButton(
                onPressed: () => Get.toNamed(Routes.SETTING),
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
