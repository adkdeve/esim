import 'package:get/get.dart';
import '../../plan/controllers/plan_controller.dart';

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

  // Popular plans for the horizontal list
  final popularPlans = <PlanItem>[
    const PlanItem(
      tier: "Premium Tier",
      name: "Premium Package",
      price: "49",
      data: "10GB",
      calls: "300 M",
      sms: "100",
    ),
    const PlanItem(
      tier: "Plus Tier",
      name: "Traveler Plus",
      price: "35",
      data: "6GB",
      calls: "200 M",
      sms: "50",
    ),
    const PlanItem(
      tier: "Starter Tier",
      name: "Starter Flex",
      price: "19",
      data: "3GB",
      calls: "100 M",
      sms: "30",
    ),
    const PlanItem(
      tier: "Pro Tier",
      name: "Business Pro",
      price: "59",
      data: "20GB",
      calls: "500 M",
      sms: "200",
    ),
    const PlanItem(
      tier: "Family Tier",
      name: "Family Max",
      price: "79",
      data: "30GB",
      calls: "Unlimited",
      sms: "Unlimited",
    ),
  ].obs;
}
