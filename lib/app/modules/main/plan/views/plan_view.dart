import 'package:esim/common/widgets/plan_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../core/core.dart';
import '../controllers/plan_controller.dart';

class PlanView extends GetView<PlanController> {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color deepPurple = AppColors.brandPurple;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          "Select Your Plan",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline_rounded,
              color: AppColors.black87,
            ),
            onPressed: () {
              // Handle help action
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            10.sbh,
            // --- 1. FILTER TABS ---
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.filters.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final filterName = controller.filters[index];
                  return Obx(() {
                    final isSelected =
                        controller.selectedFilter.value == filterName;
                    return GestureDetector(
                      onTap: () => controller.changeFilter(filterName),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 0,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? deepPurple : AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? deepPurple : AppColors.grey300,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          filterName,
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.white
                                : AppColors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),

            20.sbh,

            // --- 2. PLANS LIST ---
            Expanded(
              child: Obx(
                () => ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                  itemCount: controller.filteredPlans.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final plan = controller.filteredPlans[index];
                    return PlanCard(
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
          ],
        ),
      ),
    );
  }
}
