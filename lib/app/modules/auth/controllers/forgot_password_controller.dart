import 'package:esim/app/modules/auth/views/otp_view.dart';
import 'package:get/get.dart';
import '../../../../utils/helpers/snackbar.dart';

class ForgotPasswordController extends GetxController {
  var email = ''.obs;
  var isLoading = false.obs;

  bool get isFormFilled => email.value.trim().isNotEmpty;

  void sendOtp() {
    if (!isFormFilled) {
      return;
    }

    final emailValue = email.value.trim();
    if (!GetUtils.isEmail(emailValue)) {
      SnackBarUtils.errorMsg('Enter a valid email address');
      return;
    }

    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.to(() => const OtpView());
    });
  }
}
