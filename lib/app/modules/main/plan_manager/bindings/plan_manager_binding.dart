import 'package:get/get.dart';

import '../controllers/plan_manager_controller.dart';

class PlanManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanManagerController>(
      () => PlanManagerController(),
    );
  }
}
