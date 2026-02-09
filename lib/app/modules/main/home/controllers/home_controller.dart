import 'package:get/get.dart';

class HomeController extends GetxController {
  // User Data
  final userName = "Alex".obs;
  final phoneNumber = "+44 7700 900123".obs;

  // Usage Metrics
  final dataLeft = 4.2.obs; // GB
  final dataTotal = 18.0.obs; // Total GB (implied for percentage)
  final dataPercent = 0.23.obs; // 23%

  final minutesLeft = 120.obs;
  final minutesPercent = 0.40.obs; // 40%

  final smsLeft = 10.obs;
  final smsPercent = 0.23.obs; // 23%

  // Currencies for the horizontal list
  final currencies = [
    {"code": "USD", "flag": "🇺🇸"},
    {"code": "EUR", "flag": "🇪🇺"},
    {"code": "ETB", "flag": "🇪🇹"},
    {"code": "GBP", "flag": "🇬🇧"},
  ].obs;
}
