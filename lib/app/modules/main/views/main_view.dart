import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_navbar.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      // We extend body behind the navbar so the content flows under the floating pill
      extendBody: true,
      body: Stack(
        children: [
          // 1. The Screen Content
          // We use a SizedBox.expand to ensure the background fills the screen
          NotificationListener<ScrollNotification>(
            onNotification: controller.handleScroll,
            child: SizedBox.expand(
              child: Obx(
                () => controller.screens[controller.selectedIndex.value],
              ),
            ),
          ),

          // 2. The Floating Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Obx(
              () => CustomBottomNav(
                selectedIndex: controller.selectedIndex.value,
                width: controller.navWidth.value,
                height: controller.navHeight.value,
                onTap: (index) {
                  controller.selectedIndex.value = index;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
