import 'package:esim/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  void navigateToLogin() {
    Get.offAllNamed(Routes.AUTH + Routes.SIGNIN);
  }
}
