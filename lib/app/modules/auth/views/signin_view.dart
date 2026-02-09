import 'package:esim/app/modules/auth/controllers/signin_controller.dart';
import 'package:esim/app/modules/auth/views/forgot_password_view.dart';
import 'package:esim/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../core/core.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: MyText(
          text: 'Sign in',
          color: AppColors.black,
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
              text: 'Welcome Back',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black87,
            ),

            8.sbh,

            MyText(
              text:
                  'Sign In To Manage Your Global ESIM Plans And Cellular Services.',
              fontSize: 14,
              color: AppColors.grey,
              height: 1.5,
              softWrap: true,
              textAlign: TextAlign.start,
            ),

            40.sbh,

            CustomTextField(
              hint: 'Enter your email',
              onChanged: (val) => controller.email.value = val,
            ),

            16.sbh,

            Obx(
              () => CustomTextField(
                hint: 'Enter your password',
                isPassword: true,
                obscureText: !controller.isPasswordVisible.value,
                onChanged: (val) => controller.password.value = val,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.grey,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.to(ForgotPasswordView());
                },
                child: MyText(
                  text: 'Forgot Password?',
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
            ),

            20.sbh,

            Obx(() {
              final canSubmit = controller.isFormFilled;
              return SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: canSubmit ? controller.login : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.brandPurple,
                    disabledBackgroundColor: AppColors.brandPurple.withOpacity(
                      0.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: MyText(
                    text: 'Login',
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                ),
              );
            }),

            20.sbh,

            _buildDivider(),

            30.sbh,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _socialButton(Icons.facebook, AppColors.blue),
                _socialButton(
                  Icons.g_mobiledata,
                  AppColors.red,
                  isGoogle: true,
                ),
                _socialButton(Icons.apple, AppColors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.dividerLight)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('Or Login with', style: TextStyle(color: AppColors.grey)),
        ),
        const Expanded(child: Divider(color: AppColors.dividerLight)),
      ],
    );
  }

  Widget _socialButton(IconData icon, Color color, {bool isGoogle = false}) {
    return Container(
      width: 100,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dividerLight),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }
}
