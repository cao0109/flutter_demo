import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'post_detail_controller.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({Key? key}) : super(key: key);

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _PostDetailViewGetX();
  }
}

class _PostDetailViewGetX extends GetView<PostDetailController> {
  const _PostDetailViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("PostDetailView"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailController>(
      init: PostDetailController(),
      id: "post_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("post_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
