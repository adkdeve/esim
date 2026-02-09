import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/bindings/signin_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/auth/views/signin_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/checkout/bindings/checkout_binding.dart';
import '../modules/main/checkout/views/checkout_view.dart';
import '../modules/main/esim_installation/bindings/esim_installation_binding.dart';
import '../modules/main/esim_installation/views/esim_installation_view.dart';
import '../modules/main/home/bindings/home_binding.dart';
import '../modules/main/home/views/home_view.dart';
import '../modules/main/plan/bindings/plan_binding.dart';
import '../modules/main/plan/views/plan_view.dart';
import '../modules/main/plan_manager/bindings/plan_manager_binding.dart';
import '../modules/main/plan_manager/views/plan_manager_view.dart';
import '../modules/main/profile/bindings/profile_binding.dart';
import '../modules/main/profile/views/profile_view.dart';
import '../modules/main/top_up/bindings/top_up_binding.dart';
import '../modules/main/top_up/views/top_up_view.dart';
import '../modules/main/views/main_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;
  static const MAIN = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      children: [
        GetPage(
          name: _Paths.SIGNIN,
          page: () => SigninView(),
          binding: SigninBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: _Paths.PLAN,
          page: () => const PlanView(),
          binding: PlanBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.PLAN_MANAGER,
          page: () => const PlanManagerView(),
          binding: PlanManagerBinding(),
        ),
        GetPage(
          name: _Paths.TOP_UP,
          page: () => const TopUpView(),
          binding: TopUpBinding(),
        ),
        GetPage(
          name: _Paths.ESIM_INSTALLATION,
          page: () => const EsimInstallationView(),
          binding: EsimInstallationBinding(),
        ),
        GetPage(
          name: _Paths.CHECKOUT,
          page: () => const CheckoutView(),
          binding: CheckoutBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
