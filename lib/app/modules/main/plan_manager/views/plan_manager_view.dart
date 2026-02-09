import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../controllers/plan_manager_controller.dart';

class PlanManagerView extends GetView<PlanManagerController> {
  const PlanManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color deepPurple = AppColors.brandPurple;
    const Color textGrey = AppColors.textGrey;
    const Color dangerRed = AppColors.dangerRed;

    Get.put(PlanManagerController());

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: const Text(
          "Plan Manage",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // --- 1. SIM HERO SECTION ---
            Center(
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.lavenderLight, // Light Lavender
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.sim_card,
                      color: deepPurple,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => Text(
                      controller.phoneNumber.value,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Text(
                      controller.regionAndType.value,
                      style: const TextStyle(fontSize: 14, color: textGrey),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // --- 2. GENERAL SECTION ---
            _buildSectionHeader("General"),
            const SizedBox(height: 8),
            Container(
              decoration: _cardDecoration(),
              child: Column(
                children: [
                  Obx(
                    () => _buildListTile(
                      title: "Change Line Name",
                      subtitle: "Current: ${controller.lineName.value}",
                    ),
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(
                    title: "Update Plan",
                    subtitle: "Manage Data Packs & Roaming",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // --- 3. LINE SETTING SECTION ---
            _buildSectionHeader("Line Setting"),
            const SizedBox(height: 8),
            Container(
              decoration: _cardDecoration(),
              child: Column(
                children: [
                  Obx(
                    () => _buildListTile(
                      title: "Call Forwarding",
                      trailingText: controller.callForwardingStatus.value,
                    ),
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(
                    title: "Update Plan",
                  ), // Reusing label from image
                ],
              ),
            ),

            const SizedBox(height: 24),

            // --- 4. COMPATIBILITY SECTION ---
            _buildSectionHeader("Compatibility"),
            const SizedBox(height: 8),
            Container(
              decoration: _cardDecoration(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  Obx(
                    () => _buildInfoRow(
                      "Device Model",
                      controller.deviceModel.value,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => _buildInfoRow(
                      "ESIM Standard",
                      controller.esimStandard.value,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "EID Status",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.black87,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: AppColors.successGreen,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Verified",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.successGreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // --- 5. DEACTIVATE BUTTON ---
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: controller.deactivateEsim,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.grey300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: AppColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.power_settings_new, color: dangerRed, size: 20),
                    SizedBox(width: 8),
                    Text(
                      "Deactivate This ESIM",
                      style: TextStyle(
                        color: dangerRed,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // --- 6. DISCLAIMER ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Deactivation Is Permanent. You Will Need To Contact Support Or Purchase A New Plan To Re-Enable Service For This Number.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: textGrey, height: 1.4),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.03),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
      border: Border.all(color: AppColors.grey100),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.textGreyDark,
        ),
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    String? subtitle,
    String? trailingText,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.black87,
        ),
      ),
      subtitle: subtitle != null
          ? Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: AppColors.textGrey),
              ),
            )
          : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText,
              style: const TextStyle(fontSize: 14, color: AppColors.textGrey),
            ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: AppColors.textDisabled,
          ),
        ],
      ),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  Widget _buildInfoRow(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: const TextStyle(fontSize: 15, color: AppColors.black87),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textGreyDark,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
