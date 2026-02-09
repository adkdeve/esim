import 'package:get/get.dart';

class ProfileController extends GetxController {
  // User Profile Data
  final userName = "Alex Thompson".obs;
  final userEmail = "Alex.Thompson@Globetraveler.Com".obs;
  final profilePicUrl =
      "https://i.pravatar.cc/150?img=9".obs; // Placeholder image

  // Subscription Data
  final planName = "Global Pro Postpaid".obs;
  final planStatus = "Active • Renews Jan 24".obs;
  final paymentMethod = "Visa •••• 4242".obs;

  // App Version
  final appVersion = "2.4.0 (108)".obs;

  void signOut() {
    // Handle sign out logic
    print("User signed out");
  }
}
