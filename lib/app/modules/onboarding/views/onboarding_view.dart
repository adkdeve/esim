import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            // 1. Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/onboarding_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 2. Gradient Overlay (Darkening the image for text readability)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.brandPurple.withOpacity(0.8),
                    AppColors.brandPurple.withOpacity(0.4),
                    AppColors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),

            // 3. Content Layer
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Global eSIM',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 1),

                    // Main Heading
                    const Text(
                      'Connect\nEverywhere,simply.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'The Next Generation Of Global Connectivity\nIn Your Pocket.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.white70, fontSize: 14),
                    ),
                    const Spacer(flex: 1),

                    // Feature List
                    _buildFeatureRow(
                      'Global Coverage',
                      'Seamless Roaming In 190+ Countries',
                    ),
                    const SizedBox(height: 20),
                    _buildFeatureRow(
                      'Real Cellular Calls',
                      'Dedicated Number For Crystal Clear Calls',
                    ),
                    const SizedBox(height: 20),
                    _buildFeatureRow(
                      'Postpaid Plans',
                      'Pay Only For The Data You Use',
                    ),

                    const Spacer(),

                    // Get Started Button
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () => controller.navigateToLogin(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brandPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.public, color: AppColors.white, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: AppColors.white60, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
