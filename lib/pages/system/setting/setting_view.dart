import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/services/theme_service.dart';
import '../../../common/theme/app_theme.dart';
import 'setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ListView(
      children: [
        //主题设置 点击展开选项
        ExpansionTile(
          leading: const Icon(Icons.color_lens),
          title: const Text("theme"),
          subtitle: Obx(() => Text(
              "current theme: ${ThemeService.to.followSystem ? 'system' : ThemeService.to.appTheme}")),
          children: <Widget>[
            //switch widget 切换主题
            Obx(
              () => SwitchListTile(
                title: const Text('System'),
                subtitle: const Text('Follow system settings'),
                value: ThemeService.to.followSystem,
                onChanged: (value) {
                  ThemeService.to.followSystemChange(value);
                },
              ),
            ),
            //radio widget 切换主题
            Obx(
              () => Visibility(
                visible: !ThemeService.to.followSystem,
                child: Column(
                  children: [
                    Obx(
                      () => RadioListTile(
                        title: const Text('Light'),
                        value: AppTheme.light,
                        groupValue: ThemeService.to.appTheme,
                        onChanged: (value) {
                          ThemeService.to.changeTheme(value.toString());
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile(
                        title: const Text('Dark'),
                        value: AppTheme.dark,
                        groupValue: ThemeService.to.appTheme,
                        onChanged: (value) {
                          ThemeService.to.changeTheme(value.toString());
                        },
                      ),
                    ),
                    Obx(
                      () => RadioListTile(
                        title: const Text('Warm'),
                        value: AppTheme.warm,
                        groupValue: ThemeService.to.appTheme,
                        onChanged: (value) {
                          ThemeService.to.changeTheme(value.toString());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        //语言设置 点击展开选项
        const ListTile(
          leading: Icon(Icons.language),
          title: Text("language"),
          subtitle: Text("current language: en"),
          trailing: Icon(Icons.chevron_right),
        ),
        //关于我们
        const ListTile(
          leading: Icon(Icons.info),
          title: Text("about us"),
          trailing: Icon(Icons.chevron_right),
        ),
        //退出登录
        const ListTile(
          leading: Icon(Icons.logout),
          title: Text("logout"),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      id: "setting",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("setting")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
