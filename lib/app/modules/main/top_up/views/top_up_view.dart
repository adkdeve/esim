import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/top_up_controller.dart';

class TopUpView extends GetView<TopUpController> {
  const TopUpView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color deepPurple = Color(0xFF4A3277);
    const Color bgGrey = Color(0xFFFAFAFA);

    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Top-Up Package",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. ACTIVE PLAN DASHBOARD ---
            const Text(
              "Active E-Sim",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.planName.value,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: deepPurple,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DEF8), // Light Lavender
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Obx(
                    () => Text(
                      "${controller.dataLeft.value}GB Left",
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: deepPurple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Progress Bar
            Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: controller.dataPercent,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(deepPurple),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Usage Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    "Total ${controller.totalData.value.toInt()} GB Data",
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    "Expires In ${controller.expiryDays.value} Days",
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // --- 2. PACKAGES LIST ---
            Obx(
              () => Column(
                children: controller.packages.map((pkg) {
                  return _buildPackageCard(pkg);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageCard(Map<String, String> pkg) {
    const Color deepPurple = Color(0xFF4A3277);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Name & Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pkg["name"]!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF424242),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pkg["data"]!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: deepPurple,
                    ),
                  ),
                ],
              ),
              Text(
                "\$${pkg["price"]}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: deepPurple,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Features List
          _buildFeatureRow(Icons.calendar_today_outlined, pkg["validity"]!),
          const SizedBox(height: 8),
          _buildFeatureRow(Icons.speed, pkg["speed"]!),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: const Color(0xFF79747E),
        ), // Muted icon color
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF49454F),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
