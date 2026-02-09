import 'package:esim/app/modules/auth/views/otp_view.dart';
import 'package:get/get.dart';
import '../../../../utils/helpers/snackbar.dart';

class SigninController extends GetxController {
  var isPasswordVisible = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  bool get isFormFilled =>
      email.value.trim().isNotEmpty && password.value.trim().isNotEmpty;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() {
    if (!isFormFilled) {
      return;
    }

    final emailValue = email.value.trim();
    final passwordValue = password.value.trim();

    if (!GetUtils.isEmail(emailValue)) {
      SnackBarUtils.errorMsg('Enter a valid email address');
      return;
    }

    if (passwordValue.length < 8) {
      SnackBarUtils.errorMsg('Password must be at least 8 characters');
      return;
    }

    Get.to(() => const OtpView());
  }
}
