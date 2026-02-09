import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Brand Colors
    const Color deepPurple = Color(0xFF4A3277);

    return Scaffold(
      backgroundColor: Colors.white, // Match background
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. HEADER SECTION ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        'Hello, ${controller.userName}',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1D1B20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Welcome back to 1 Global',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _circleIconBtn(Icons.notifications_none_rounded),
                    const SizedBox(width: 12),
                    _circleIconBtn(Icons.settings_outlined),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // --- 2. ACTIVE LINE CARD ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFBFAEE3), // Soft Purple from image
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.sim_card_outlined,
                            color: deepPurple,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Active 1 Global Line",
                            style: TextStyle(
                              color: deepPurple,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF43A047), // Green Badge
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Active",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Assigned Number",
                    style: TextStyle(color: Color(0xFF5E4B8A), fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Obx(
                    () => Text(
                      controller.phoneNumber.value,
                      style: const TextStyle(
                        color: deepPurple,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // --- 3. METRICS GRID ---
            // Row 1: Data & Minutes
            Row(
              children: [
                Expanded(
                  child: _metricCard(
                    title: "Data",
                    value: "4.2GB left",
                    percent: 0.23,
                    color: const Color(0xFFE2E6FF), // Light Blue
                    progressColor: const Color(0xFF4A3277),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _metricCard(
                    title: "Minutes",
                    value: "120 min left",
                    percent: 0.40,
                    color: const Color(0xFFFFE5EA), // Light Pink
                    progressColor: const Color(0xFF4A3277),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Row 2: SMS & Actions
            Row(
              children: [
                Expanded(
                  child: _metricCard(
                    title: "SMS",
                    value: "10 SMS left",
                    percent: 0.23,
                    color: const Color(0xFFE0F7E6), // Light Green
                    progressColor: const Color(0xFF4A3277),
                  ),
                ),
                const SizedBox(width: 16),
                // The Action Buttons Column
                Expanded(
                  child: Column(
                    children: [
                      _actionButton(
                        icon: Icons.settings_suggest_outlined,
                        label: "Plan Manage",
                        color: const Color(0xFFDFF1FF),
                        onTap: () => Get.toNamed(Routes.PLAN_MANAGER),
                      ),
                      const SizedBox(height: 16),
                      _actionButton(
                        icon: Icons.add,
                        label: "Add Top Up",
                        color: const Color(0xFFFFF7DB),
                        onTap: () => Get.toNamed(Routes.CHECKOUT),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // --- 4. GLOBAL DESTINATIONS ---
            const Text(
              "Global Destinations",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D1B20),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4, // Add more as needed
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  // Mock data for list
                  final flags = [
                    "🇺🇸 USD",
                    "🇪🇺 EUR",
                    "🇪🇹 ETB",
                    "🇬🇧 GBP",
                  ];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        // Extract flag and text roughly
                        Text(
                          flags[index].split(' ')[0],
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          flags[index].split(' ')[1],
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // --- 5. POPULAR PACKAGE ---
            const Text(
              "Popular Package",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D1B20),
              ),
            ),
            const SizedBox(height: 16),

            // Package Card (Cutoff in screenshot, but reconstructing top)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "PREMIUM TIER",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$49",
                        style: TextStyle(
                          color: deepPurple,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "/Month",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ),
                  const Text(
                    "Local St...",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: deepPurple,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Bottom spacer for the floating nav bar
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _circleIconBtn(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black87, size: 22),
    );
  }

  Widget _metricCard({
    required String title,
    required String value,
    required double percent,
    required Color color,
    required Color progressColor,
  }) {
    return Container(
      height: 150, // Fixed height for square look
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1D1B20),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D1B20),
                ),
              ),
            ],
          ),
          // Custom Circular Progress
          SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: percent,
                  strokeWidth: 6,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  color: progressColor,
                ),
                Center(
                  child: Text(
                    "${(percent * 100).toInt()}%",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: progressColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required Color color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 67, // Half of 150 - gap/2 approx
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: const Color(0xFF1D1B20)),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1D1B20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
