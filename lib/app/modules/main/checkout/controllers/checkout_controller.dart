import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class CheckoutController extends GetxController {
  // 0: Apple Pay, 1: Google Pay, 2: Credit Card
  final selectedPaymentMethod = 0.obs;

  void selectPaymentMethod(int index) {
    selectedPaymentMethod.value = index;
  }

  void confirmSubscription() {
    Get.offAllNamed(Routes.ESIM_INSTALLATION);
  }
}
