import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_index_controller.dart';

class HomeIndexView extends GetView<HomeIndexController> {
  const HomeIndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeIndexController>(
      init: HomeIndexController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('HomeIndexView'),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.getPosts();
                },
                child: const Text('Get Posts'),
              ),
            ],
          ),
        );
      },
    );
  }
}
