import 'package:get/get.dart';

class PlanManagerController extends GetxController {
  // Line Info
  final phoneNumber = "+44 7700 900123".obs;
  final regionAndType = "United Kingdom • Postpaid Plan".obs;

  // Settings Data
  final lineName = "United Kingdom".obs;
  final callForwardingStatus = "Off".obs;

  // Compatibility Data
  final deviceModel = "iPhone 15 Pro Max".obs;
  final esimStandard = "Digital SIM (GSMA)".obs;
  final isEidVerified = true.obs;

  void deactivateEsim() {
    print("Deactivate eSIM Triggered");
  }
}
