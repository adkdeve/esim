import 'package:get/get.dart';

import '../controllers/esim_installation_controller.dart';

class EsimInstallationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EsimInstallationController>(
      () => EsimInstallationController(),
    );
  }
}
