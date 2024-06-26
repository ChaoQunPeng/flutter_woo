import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/index.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
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

  // 主视图
  Widget _buildView() {
    DateTime? lastPressedAt;
    return WillPopScope(
      // 防止连续点击两次退出
      onWillPop: () async {
        if (lastPressedAt == null ||
            DateTime.now().difference(lastPressedAt!) >
                const Duration(seconds: 1)) {
          lastPressedAt = DateTime.now();
          Loading.toast('Press again to exit');
          return false;
        }
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        // 导航栏
        bottomNavigationBar: GetBuilder<MainController>(
          id: 'navigation',
          builder: (controller) {
            return Obx(() => BuildNavigation(
                  currentIndex: controller.currentIndex,
                  items: [
                    NavigationItemModel(
                      label: LocaleKeys.tabBarHome.tr,
                      icon: AssetsSvgs.navHomeSvg,
                    ),
                    NavigationItemModel(
                      label: LocaleKeys.tabBarCart.tr,
                      icon: AssetsSvgs.navCartSvg,
                      // 购物车数量
                      count: CartService.to.lineItemsCount,
                    ),
                    NavigationItemModel(
                      label: LocaleKeys.tabBarMessage.tr,
                      icon: AssetsSvgs.navMessageSvg,
                      count: 1,
                    ),
                    NavigationItemModel(
                      label: LocaleKeys.tabBarProfile.tr,
                      icon: AssetsSvgs.navProfileSvg,
                    ),
                  ],
                  onTap: controller.onJumpToPage, // 切换tab事件
                ));
          },
        ),
        // appBar: AppBar(
        //   title: const Text("main"),
        // ),
        // 内容页
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onIndexChanged,
          children: const [
            // 这里已经生效了，但是视图在顶部，没显示，差点以为没生效
            // 加入空页面占位
            HomePage(),
            CartIndexPage(),
            MsgIndexPage(),
            MyIndexPage(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      // init: Get.find<MainController>(),
      id: "main",
      builder: (_) => _buildView(),
    );
  }
}
