import 'package:esim/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../core/core.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordController());

    return Scaffold(
      backgroundColor: R.theme.white,
      appBar: AppBar(
        backgroundColor: R.theme.white,
        elevation: 0,
        centerTitle: true,
        title: MyText(
          text: 'Sign in',
          color: R.theme.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.sbh,

            MyText(
              text: 'Reset Password',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),

            12.sbh,

            MyText(
              text:
                  'Enter The Email Address Associated With Your ESIM Account And We\'ll Send You A Secure Link To Reset Your Password.',
              fontSize: 14,
              color: R.theme.grey,
              height: 1.6,
              textAlign: TextAlign.start,
              softWrap: true,
            ),

            40.sbh,

            CustomTextField(
              hint: 'Enter your email',
              onChanged: (val) => controller.email.value = val,
            ),

            25.sbh,

            Obx(() {
              final canSubmit =
                  controller.isFormFilled && !controller.isLoading.value;
              return SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: canSubmit ? controller.sendOtp : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A3277),
                    disabledBackgroundColor: const Color(
                      0xFF4A3277,
                    ).withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: controller.isLoading.value
                      ? CircularProgressIndicator(color: R.theme.white)
                      : MyText(
                          text: 'Send OTP',
                          fontSize: 16,
                          color: R.theme.white,
                          fontWeight: FontWeight.w600,
                        ),
                ),
              );
            }),

            30.sbh,

            Center(
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Remember Your Password? ',
                    style: TextStyle(color: R.theme.grey, fontSize: 14),
                    children: const [
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          color: Color(0xFF4A3277),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
