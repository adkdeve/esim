import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color deepPurple = AppColors.brandPurple;
    const Color bgGrey = AppColors.backgroundAlt;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // SCROLLABLE CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- 1. PLAN SUMMARY CARD ---
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.brandPurpleDark.withOpacity(0.1),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Global",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "World Explorer",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: deepPurple,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Updated Features with Circle Backgrounds
                        _buildFeatureRow(Icons.storage, "20GB High-Speed Data"),
                        const SizedBox(height: 12),
                        _buildFeatureRow(
                          Icons.phone_outlined,
                          "100 M Global Voice",
                        ),
                        const SizedBox(height: 12),
                        _buildFeatureRow(Icons.message_outlined, "100 SMS"),

                        const SizedBox(height: 16),
                        Text(
                          "Global Coverage 150+ Country",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey600,
                          ),
                        ),
                        const Divider(color: AppColors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Renewal Date",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.grey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "24th Of Every Month",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.grey800,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Change",
                                style: TextStyle(
                                  color: deepPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // --- 2. PAYMENT METHOD HEADER ---
                  const Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- 3. PAYMENT OPTIONS ---
                  Obx(
                    () => Column(
                      children: [
                        _buildPaymentOption(
                          index: 0,
                          icon: Icons.apple,
                          label: "Apple pay",
                          iconColor: AppColors.black,
                        ),
                        const SizedBox(height: 12),
                        _buildPaymentOption(
                          index: 1,
                          icon: Icons.payment,
                          label: "Google Pay",
                          iconColor: AppColors.blue,
                        ),
                        const SizedBox(height: 12),
                        _buildPaymentOption(
                          index: 2,
                          icon: Icons.credit_card,
                          label: ".......4242",
                          subLabel: "EXPIRES 12/26",
                          iconColor: AppColors.blueAccent,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Add New Method Button
                  Container(
                    width: double.infinity,
                    height: 54,
                    decoration: BoxDecoration(
                      color: bgGrey,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.grey400,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Add New Payment Getaway",
                      style: TextStyle(color: AppColors.grey600, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- 4. FOOTER ---
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total To Pay Today",
                    style: TextStyle(fontSize: 14, color: AppColors.black87),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: const TextSpan(
                      text: "\$45.00",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: deepPurple,
                      ),
                      children: [
                        TextSpan(
                          text: "/Month",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller.confirmSubscription,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Confirm & Subscribe",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Legal Disclaimer with Hyperlink
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.grey,
                          height: 1.4,
                          fontFamily: 'Roboto',
                        ),
                        children: [
                          const TextSpan(
                            text:
                                "Subscription starts today. Cancel anytime in settings.\nBy continuing, you agree to our ",
                          ),
                          TextSpan(
                            text: "Terms of Service.",
                            style: const TextStyle(
                              color: deepPurple,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const TermsView());
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- UPDATED HELPER WIDGET FOR ICONS ---
  Widget _buildFeatureRow(IconData icon, String text) {
    const Color deepPurple = AppColors.brandPurple;

    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            // Light purple circle background
            color: AppColors.lavenderPale,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 18,
            color: AppColors.brandPurpleDark,
          ), // Icon matches theme
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption({
    required int index,
    required IconData icon,
    required String label,
    required Color iconColor,
    String? subLabel,
  }) {
    bool isSelected = controller.selectedPaymentMethod.value == index;
    const Color deepPurple = AppColors.brandPurple;

    return GestureDetector(
      onTap: () => controller.selectPaymentMethod(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: deepPurple, width: 1.5)
              : Border.all(color: AppColors.transparent),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.black87,
                  ),
                ),
                if (subLabel != null)
                  Text(
                    subLabel,
                    style: TextStyle(fontSize: 11, color: AppColors.grey600),
                  ),
              ],
            ),
            const Spacer(),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? deepPurple : AppColors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: deepPurple,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Terms of Service",
          style: TextStyle(color: AppColors.black),
        ),
        backgroundColor: AppColors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: const Center(child: Text("Terms and conditions content...")),
    );
  }
}
