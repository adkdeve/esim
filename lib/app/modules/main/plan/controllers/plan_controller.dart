import 'package:get/get.dart';

class PlanItem {
  final String name;
  final String price;
  final String data;
  final String calls;
  final String sms;
  final String? tier;
  final String? region;
  final String? note;

  const PlanItem({
    required this.name,
    required this.price,
    required this.data,
    required this.calls,
    required this.sms,
    this.tier,
    this.region,
    this.note,
  });
}

class PlanController extends GetxController {
  final selectedFilter = "All Plans".obs;

  final filters = ["All Plans", "Global", "Region"];

  final List<PlanItem> allPlans = const [
    PlanItem(
      tier: "PREMIUM TIER",
      name: "Local Starter",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
    PlanItem(
      tier: "PREMIUM TIER",
      name: "Local Starter",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
    PlanItem(
      tier: "PREMIUM TIER",
      name: "Local Starter",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
    PlanItem(
      tier: "PREMIUM TIER",
      name: "Local Starter",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
  ];

  final List<PlanItem> globalPlans = const [
    PlanItem(
      region: "Global",
      name: "World Explorer",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
      note: "Global Coverage 150+ Country",
    ),
    PlanItem(
      region: "Asia",
      name: "Unlimited Elite",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
    PlanItem(
      region: "Africa",
      name: "Global Explorer",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
    PlanItem(
      region: "Global",
      name: "Unlimited",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
  ];

  final List<PlanItem> regionPlans = const [
    PlanItem(
      region: "UK",
      name: "Local Starter",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
    PlanItem(
      region: "UAE",
      name: "Local Starter",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
    PlanItem(
      region: "US",
      name: "Local Starter",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
    PlanItem(
      region: "US",
      name: "Local Starter",
      price: "49",
      data: "56B",
      calls: "100 M",
      sms: "50",
    ),
  ];

  List<PlanItem> get filteredPlans {
    switch (selectedFilter.value) {
      case "Global":
        return globalPlans;
      case "Region":
        return regionPlans;
      case "All Plans":
      default:
        return allPlans;
    }
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}
