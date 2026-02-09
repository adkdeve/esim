import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/plan_manager_controller.dart';

class PlanManagerView extends GetView<PlanManagerController> {
  const PlanManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color deepPurple = Color(0xFF4A3277);
    const Color textGrey = Color(0xFF757575);
    const Color dangerRed = Color(0xFFFF3B30);

    Get.put(PlanManagerController());

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Plan Manage",
          style: TextStyle(
            color: Colors.black,
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
                      color: const Color(0xFFE8DEF8), // Light Lavender
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
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Color(0xFF4CAF50),
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Verified",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4CAF50),
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
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.white,
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
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
      border: Border.all(color: Colors.grey.shade100),
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
          color: Color(0xFF424242),
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
          color: Colors.black87,
        ),
      ),
      subtitle: subtitle != null
          ? Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Color(0xFF757575)),
              ),
            )
          : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText,
              style: const TextStyle(fontSize: 14, color: Color(0xFF757575)),
            ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Color(0xFFBDBDBD),
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
        Text(key, style: const TextStyle(fontSize: 15, color: Colors.black87)),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF424242),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
