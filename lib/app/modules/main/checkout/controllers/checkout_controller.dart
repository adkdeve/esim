import 'package:get/get.dart';

class CheckoutController extends GetxController {
  // 0: Apple Pay, 1: Google Pay, 2: Credit Card
  final selectedPaymentMethod = 0.obs;

  void selectPaymentMethod(int index) {
    selectedPaymentMethod.value = index;
  }

  void confirmSubscription() {
    print(
      "Processing payment with method index: ${selectedPaymentMethod.value}",
    );
    // Navigate to success or home after processing
    Get.offAllNamed('/home');
    Get.snackbar("Success", "Subscription confirmed successfully!");
  }
}
