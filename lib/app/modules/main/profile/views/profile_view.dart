import 'package:esim/app/modules/main/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color deepPurple = Color(0xFF4A3277);
    const Color textGrey = Color(0xFF757575);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // Slightly off-white background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Account",
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
            // --- 1. PROFILE HEADER ---
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(controller.profilePicUrl.value),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => Text(
                      controller.userName.value,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Obx(
                    () => Text(
                      controller.userEmail.value,
                      style: const TextStyle(fontSize: 14, color: textGrey),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // --- 2. BILLING SUBSCRIPTION SECTION ---
            _buildSectionHeader("Billing Subscription"),
            const SizedBox(height: 8),
            Container(
              decoration: _cardDecoration(),
              child: Column(
                children: [
                  // Plan Item (Custom Layout)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  controller.planName.value,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Obx(
                                () => Text(
                                  controller.planStatus.value,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: textGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              "Change",
                              style: TextStyle(color: textGrey, fontSize: 13),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: textGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),

                  // Invoices Item
                  _buildListTile(title: "Invoices & History"),
                  const Divider(height: 1, indent: 16, endIndent: 16),

                  // Payment Method Item
                  _buildListTile(
                    title: "Payment Methods",
                    trailingText: controller.paymentMethod.value,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // --- 3. SUPPORT & LEGAL SECTION ---
            _buildSectionHeader("Support & Legal"),
            const SizedBox(height: 8),
            Container(
              decoration: _cardDecoration(),
              child: Column(
                children: [
                  _buildListTile(title: "Help Center"),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(title: "Contact Support"),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(title: "Terms & Privacy Policy"),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // --- 4. SIGN OUT BUTTON ---
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: controller.signOut,
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
                    Icon(
                      Icons.power_settings_new,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Sign Out",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // --- 5. FOOTER ---
            const Text(
              "ESIM GLOBAL CONNECTIVITY",
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Obx(
              () => Text(
                "Version ${controller.appVersion.value}",
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),

            // Extra padding for safe area
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
          color: Color(0xFF424242), // Darker grey for legibility
        ),
      ),
    );
  }

  Widget _buildListTile({required String title, String? trailingText}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText,
              style: const TextStyle(fontSize: 14, color: Color(0xFF757575)),
            ),
          if (trailingText != null) const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Color(0xFFBDBDBD),
          ),
        ],
      ),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      visualDensity:
          VisualDensity.compact, // Reduces vertical spacing to match design
    );
  }
}
