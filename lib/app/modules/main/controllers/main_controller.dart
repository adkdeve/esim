import 'dart:convert';
import 'package:esim/app/modules/main/home/controllers/home_controller.dart';
import 'package:esim/app/modules/main/home/views/home_view.dart';
import 'package:esim/app/modules/main/plan/controllers/plan_controller.dart';
import 'package:esim/app/modules/main/plan/views/plan_view.dart';
import 'package:esim/app/modules/main/profile/controllers/profile_controller.dart';
import 'package:esim/app/modules/main/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../utils/helpers/easy_loading.dart';
import '../../../../utils/helpers/snackbar.dart';
import '../../../core/core.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/repository.dart';
import '../../../data/services/auth_service.dart';

class MainController extends GetxController {
  RxInt selectedIndex = 0.obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final myRepo = Get.find<Repository>();
  final logger = Get.find<Logger>();
  final storage = Get.find<FlutterSecureStorage>();
  final loading = Get.find<MyLoading>();
  var authService = Get.find<AuthService>();

  final currentUser = Rxn<UserModel>();

  UserModel? get user => currentUser.value;

  final index = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    // Reads from Secure Storage via AuthService
    UserModel? loadedUser = await authService.getUserData();
    currentUser.value = loadedUser; // Triggers UI updates
  }

  Future<void> postApi(var data, String url) async {
    logger.v(url);
    logger.v(data);
    loading.showEasyLoading('Loading...');
    Get.focusScope?.unfocus();
    myRepo
        .postApiWithHeader(data, url)
        .then((value) async {
          if (value != null) {
            final response = json.decode(value);
            logger.d(response);

            if (response?['success'] == true) {
              switch (url) {
                case ApisUrl.updateProfile:
                  Get.back();
                  break;
                case ApisUrl.changePassword:
                  SnackBarUtils.successMsg(response['message']);
                  Get.back();
                  break;
                case ApisUrl.contactUs:
                  Get.back();
                  break;

                default:
                  SnackBarUtils.successMsg(response['message']);
              }
            } else {
              SnackBarUtils.errorMsg(response['message']);
            }
          }
          loading.dismissEasyLoading();
        })
        .onError((error, stackTrace) {
          logger.e(error);
          loading.dismissEasyLoading();
          SnackBarUtils.showError(error.toString());
        });
  }

  List<Widget> get screens => [
    GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => const HomeView(),
    ),
    GetBuilder<PlanController>(
      init: PlanController(),
      builder: (_) => const PlanView(),
    ),
    GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => const ProfileView(),
    ),
  ];
}
