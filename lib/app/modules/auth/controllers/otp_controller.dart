import 'package:esim/utils/helpers/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/welcome_view.dart';

class OtpController extends GetxController {
  final otpValues = List.generate(4, (index) => ''.obs);
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  void verifyCode() {
    String code = otpValues.map((e) => e.value).join();
    if (code.length == 4) {
      Get.to(const WelcomeView());
    } else {
      SnackBarUtils.errorMsg("Please enter the full 4-digit code");
    }
  }

  @override
  void onClose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }
}
