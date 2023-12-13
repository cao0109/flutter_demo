import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'main_controller.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX({Key? key}) : super(key: key);

  Widget _tab(
      {required int index,
      required IconData icon,
      required IconData selectedIcon,
      required String text}) {
    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              controller.currentIndex.value == index ? selectedIcon : icon,
              color: controller.currentIndex.value == index
                  ? Get.theme.colorScheme.primary
                  : null,
            ),
            Text(
              text,
              style: TextStyle(
                color: controller.currentIndex.value == index
                    ? Get.theme.colorScheme.primary
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_) {
        return Scaffold(
          body: Obx(
            () => IndexedStack(
              index: _.currentIndex.value,
              children: _.pages,
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 8,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _tab(
                    index: 0,
                    icon: Icons.home_outlined,
                    selectedIcon: Icons.home,
                    text: "home".tr,
                  ),
                  _tab(
                    index: 1,
                    icon: Icons.settings_outlined,
                    selectedIcon: Icons.settings,
                    text: "setting".tr,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: "add".tr,
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        );
      },
    );
  }
}
