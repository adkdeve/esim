import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/build_image.dart';
import '../../../../core/core.dart';
import '../../../../routes/app_pages.dart';

class EsimSuccessView extends StatelessWidget {
  const EsimSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color deepPurple = AppColors.brandPurple;
    const Color textGrey = AppColors.textGrey;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.black),
          onPressed: () => Get.offAllNamed(Routes.MAIN), // Close to home
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    buildImage("assets/images/success.png", context: context),

                    // --- 1. SUCCESS HEADER ---
                    const Text(
                      "eSIM Ready!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Your Global Postpaid Plan Has Been Successfully Activated And Is Ready To Use.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: textGrey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 48),

                    // --- 2. FINAL INSTRUCTIONS ---
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Final Phone Setup",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    _buildStep(
                      number: "1",
                      title: "Label Your Line",
                      description:
                          "Go To Settings > Cellular And Label This ESIM As \"Travel\".",
                    ),
                    const SizedBox(height: 24),
                    _buildStep(
                      number: "2",
                      title: "Set Default Data",
                      description:
                          "Set Cellular Data To Your New Plan For Global Roaming.",
                    ),
                    const SizedBox(height: 24),
                    _buildStep(
                      number: "3",
                      title: "Enable Data Roaming",
                      description:
                          "Turn On Data Roaming For The New Line To Connect Abroad.",
                    ),
                  ],
                ),
              ),
            ),

            // --- 3. HOME BUTTON ---
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to the main dashboard/home
                      Get.offAllNamed(Routes.MAIN);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Go to home",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({
    required String number,
    required String title,
    required String description,
  }) {
    // Helper to bold specific keywords in the description string if needed
    // For simplicity, we render the description as standard text here.

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.grey200,
            shape: BoxShape.circle,
          ),
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.black87,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textGrey,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
