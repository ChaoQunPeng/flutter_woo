import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class StyleIndexPage extends GetView<StyleIndexController> {
  const StyleIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("StyleIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StyleIndexController>(
      init: StyleIndexController(),
      id: "style_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("style_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
