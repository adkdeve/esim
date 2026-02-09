import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/widgets/build_image.dart';
import '../../../../core/core.dart';
import '../controllers/esim_installation_controller.dart';

class EsimInstallationView extends GetView<EsimInstallationController> {
  const EsimInstallationView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color deepPurple = AppColors.brandPurple;
    const Color textGrey = AppColors.textGrey;
    const Color successGreen = AppColors.successGreen;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          "eSIM Installation",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // --- 1. DYNAMIC PROGRESS HEADER ---
                    Obx(() {
                      if (!controller.isInstalling.value &&
                          !controller.isInstalled.value) {
                        return const SizedBox(
                          height: 20,
                        ); // Empty space when idle
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Ready to Install",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: deepPurple,
                                ),
                              ),
                              Text(
                                "${(controller.installProgress.value * 100).toInt()}%",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: textGrey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: controller.installProgress.value,
                              minHeight: 8,
                                  backgroundColor: AppColors.grey200,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                deepPurple,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              // Show checkmark only if progress is significant or done
                              if (controller.installProgress.value > 0.1)
                                const Icon(
                                  Icons.check_circle,
                                  color: successGreen,
                                  size: 20,
                                ),
                              if (controller.installProgress.value > 0.1)
                                const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  controller.installStatus.value,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        controller.installProgress.value >= 1.0
                                        ? AppColors.black87
                                        : textGrey,
                                    fontWeight:
                                        controller.installProgress.value >= 1.0
                                        ? FontWeight.w500
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    }),

                    // --- 2. HERO GRAPHIC ---
                    buildImage(
                      "assets/images/esim_installation.png",
                      context: context,
                    ),

                    const SizedBox(height: 32),

                    // --- 3. DYNAMIC HEADLINE ---
                    Obx(
                      () => Text(
                        controller.isInstalling.value
                            ? "Installing your eSIM profile"
                            : "Install your eSIM profile",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Checking The Button Will The IOS System Dalco To Securely Add This Plan To Your iPhone.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: textGrey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // --- 4. SYSTEM SETUP GUIDE ---
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "SYSTEM SETUP GUIDE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.grey600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    _buildStep(
                      number: "1",
                      title: "Approve Request",
                      description:
                          "Accept The \"Cellular Plan Notification From IOS.\"",
                    ),
                    const SizedBox(height: 24),
                    _buildStep(
                      number: "2",
                      title: "Assign Label",
                      description:
                          "Label This Line As \"Travel\" To Keep It Separate From Your Primary Number.",
                    ),
                    const SizedBox(height: 24),
                    _buildStep(
                      number: "3",
                      title: "Enable Roaming",
                      description:
                          "Once Installed, Ensure \"Data Roaming\" Is Switched ON For This Line.",
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // --- 5. FOOTER ACTIONS ---
            SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed:
                            controller.isInstalling.value ||
                                controller.isInstalled.value
                            ? null // Disable button while installing or if done
                            : controller.startInstallation,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: deepPurple,
                          disabledBackgroundColor: deepPurple.withOpacity(0.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: controller.isInstalling.value
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                controller.isInstalled.value
                                    ? "Installation Started"
                                    : "Install eSIM",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Hide secondary link during install to focus user
                  Obx(
                    () => Opacity(
                      opacity: controller.isInstalling.value ? 0.0 : 1.0,
                      child: GestureDetector(
                        onTap: controller.openManualInstall,
                        child: RichText(
                          text: TextSpan(
                            text: "Having trouble? ",
                            style: const TextStyle(
                              color: textGrey,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: "Manual Install",
                                style: const TextStyle(
                                  color: deepPurple,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
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
