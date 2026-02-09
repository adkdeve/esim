import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/plan_card.dart';
import '../../../../core/core.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Brand Colors
    const Color deepPurple = Color(0xFF4A3277);

    return Scaffold(
      backgroundColor: R.theme.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                          color: Colors.black54,
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
                      percent: 0.95,
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
                          onTap: () => Get.toNamed(Routes.TOP_UP),
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
                height: 45,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    // 1. UPDATED DATA: We need image URLs/Assets instead of Emojis now
                    final currencies = [
                      {"code": "USD", "flag": "https://flagcdn.com/w80/us.png"},
                      {"code": "EUR", "flag": "https://flagcdn.com/w80/eu.png"},
                      {"code": "ETB", "flag": "https://flagcdn.com/w80/et.png"},
                      {"code": "GBP", "flag": "https://flagcdn.com/w80/gb.png"},
                    ];

                    final item = currencies[index];

                    return Container(
                      padding: const EdgeInsets.fromLTRB(
                        6,
                        6,
                        16,
                        6,
                      ), // Tight left padding for flag
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          50,
                        ), // Stadium/Pill shape
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 2. THE FIX: Using ClipOval to make the image circular
                          ClipOval(
                            child: Image.network(
                              item["flag"]!, // Replace with buildImage(...) if using your custom helper
                              width: 32, // Size of the circle
                              height: 32,
                              fit: BoxFit
                                  .cover, // Ensures flag fills the circle without distortion
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.error,
                                  ), // Fallback if image fails
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            item["code"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF49454F),
                            ),
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

              SizedBox(
                height: 170,
                child: Obx(
                  () => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.popularPlans.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final plan = controller.popularPlans[index];
                      return PlanCard(
                        width: 260,
                        name: plan.name,
                        price: plan.price,
                        data: plan.data,
                        calls: plan.calls,
                        sms: plan.sms,
                        topLabel: plan.tier ?? plan.region,
                        note: plan.note,
                        onTap: () => Get.toNamed(Routes.CHECKOUT),
                      );
                    },
                  ),
                ),
              ),

              80.sbh,
            ],
          ),
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
      height: 150,
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
