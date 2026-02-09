import 'dart:async';

import 'package:esim/app/modules/main/esim_installation/views/esim_installation_success.dart';
import 'package:get/get.dart';

class EsimInstallationController extends GetxController {
  final isInstalling = false.obs;
  final installProgress = 0.0.obs;
  final installStatus = "".obs;
  final isInstalled = false.obs;

  void startInstallation() {
    if (isInstalling.value || isInstalled.value) return;

    isInstalling.value = true;
    installProgress.value = 0.0;
    installStatus.value = "Initializing secure connection...";

    Timer.periodic(const Duration(milliseconds: 400), (timer) {
      // Increment progress
      installProgress.value += 0.05 + (0.02 * (timer.tick % 3));

      // Update status text
      if (installProgress.value < 0.2) {
        installStatus.value = "Establishing handshake...";
      } else if (installProgress.value < 0.5) {
        installStatus.value = "Generating unique eSIM profile...";
      } else if (installProgress.value < 0.8) {
        installStatus.value = "Encrypting profile data...";
      } else if (installProgress.value < 0.95) {
        installStatus.value = "Verifying with carrier...";
      }

      // COMPLETION CHECK
      if (installProgress.value >= 1.0) {
        timer.cancel();
        installProgress.value = 1.0;
        installStatus.value = "Profile Generated And Encrypted";
        isInstalled.value = true;
        isInstalling.value = false;

        // --- NAVIGATION TRIGGER ---
        // Wait briefly so user sees the 100% completion, then switch screens
        Future.delayed(const Duration(milliseconds: 500), () {
          // Get.off replaces the current screen so user can't "back" into the loading screen
          Get.off(() => const EsimSuccessView());
        });
      }
    });
  }

  void openManualInstall() {
    print("Navigating to Manual Install guide...");
  }
}
