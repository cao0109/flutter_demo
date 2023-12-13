import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'main_controller.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
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
              child: Container(
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          _.changePage(0);
                        },
                        icon: const Icon(Icons.home_outlined),
                        selectedIcon: const Icon(Icons.home_filled),
                        isSelected: _.currentIndex.value == 0,
                      ),
                    ),
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          _.changePage(1);
                        },
                        icon: const Icon(Icons.person_outline),
                        selectedIcon: const Icon(Icons.person),
                        isSelected: _.currentIndex.value == 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
