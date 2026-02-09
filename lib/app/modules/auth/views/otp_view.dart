import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../core/core.dart';
import '../../../routes/app_pages.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpController());

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.sbh,

            MyText(
              text: 'Verify your account',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black87,
            ),

            12.sbh,

            MyText(
              text:
                  'Enter The 4-Digit Code Sent To Your Registered Phone Number For Your ESIM Setup And Global Connectivity.',
              fontSize: 14,
              color: AppColors.grey,
              height: 1.6,
              textAlign: TextAlign.start,
              softWrap: true,
            ),

            40.sbh,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) => _otpBox(index, context)),
            ),

            40.sbh,

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => controller.verifyCode(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: MyText(
                  text: 'Verify',
                  fontSize: 18,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // 20.sbh,
            // Center(
            //   child: InkWell(
            //     onTap: () => Get.offAllNamed(Routes.MAIN),
            //     child: RichText(
            //       text: TextSpan(
            //         text: 'Remember Your Password? ',
            //         style: TextStyle(color: R.theme.grey, fontSize: 14),
            //         children: const [
            //           TextSpan(
            //             text: 'Log In',
            //             style: TextStyle(
            //               color: Color(0xFF4A3277),
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _otpBox(int index, BuildContext context) {
    return Obx(() {
      // Determine if this specific box is "active" (has a value)
      bool hasValue = controller.otpValues[index].value.isNotEmpty;

      return Container(
        width: 60, // Slightly narrower to match the square aspect ratio
        height: 60,
        decoration: BoxDecoration(
          // F7F8F9 is correct, but E8ECF4 for the border matches the login inputs
          color: AppColors.inputFill,
          borderRadius: BorderRadius.circular(
            15,
          ), // Softer, more modern corners
          border: Border.all(
            color: hasValue ? AppColors.brandPurple : AppColors.dividerLight,
            width: hasValue ? 2.0 : 1.0, // Thicker border when active
          ),
        ),
        child: Center(
          child: TextField(
            controller: controller.controllers[index],
            focusNode: controller.focusNodes[index],
            onChanged: (value) {
              controller.otpValues[index].value = value;
              if (value.isNotEmpty && index < 3) {
                FocusScope.of(
                  context,
                ).requestFocus(controller.focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(
                  context,
                ).requestFocus(controller.focusNodes[index - 1]);
              }
            },
            textAlign: TextAlign.center,
            // Using a dark slate color for the text to match the UI
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.textSlate,
            ),
            keyboardType: TextInputType.number,
            // cursorColor: const Color(0xFF4A3277), // Match brand color
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              isDense: true, // Removes default internal padding
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      );
    });
  }
}
