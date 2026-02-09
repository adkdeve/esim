import 'package:get/get.dart';

class TopUpController extends GetxController {
  // Active Plan Data
  final planName = "Global Connect Plan".obs;
  final dataLeft = 1.2.obs; // GB
  final totalData = 10.0.obs; // GB
  final expiryDays = 14.obs;

  // Computed percentage for the progress bar
  double get dataPercent => dataLeft.value / totalData.value;

  // Available Packages (Mock Data)
  final packages = [
    {
      "name": "Quick Boost",
      "data": "1 GB Data",
      "price": "4",
      "validity": "Valid For 7 Days",
      "speed": "LTE/5G High-Speed",
    },
    {
      "name": "Streaming Pack",
      "data": "5 GB Data", // Adjusted for realism, though image says 1GB
      "price": "19",
      "validity": "Valid For 30 Days",
      "speed": "LTE/5G High-Speed",
    },
    {
      "name": "Heavy User",
      "data": "15 GB Data", // Adjusted for realism
      "price": "50",
      "validity": "Valid For 30 Days",
      "speed": "LTE/5G High-Speed",
    },
  ].obs;

  void purchasePackage(String packageName) {
    print("Purchased $packageName");
  }
}
