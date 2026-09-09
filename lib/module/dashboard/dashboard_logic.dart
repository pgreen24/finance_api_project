import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';

import '../../provider/api_services.dart';
import '../login/data_model/user_data_model.dart';
import 'widgets/user_information_dialog.dart';

class DashboardLogic extends GetxController
    with GetSingleTickerProviderStateMixin {

  final GetStorage storage = GetStorage();

  RxBool isLoading = true.obs;

  RxList<UserDataModel> allUser = <UserDataModel>[].obs;

  Map<String, dynamic> userData = {};

  UserDataModel onePersonData = UserDataModel();

  late TabController tabController;

  final List<Tab> tab = const [
    Tab(text: 'Login User'),
    Tab(text: 'All Users'),
  ];

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(
      length: tab.length,
      vsync: this,
    );

    userData = storage.read('userData') ?? {};
    _loadData();
  }



  Future<void> _loadData() async {
    isLoading.value = true;

    try {
      await _getAllUsers();
    } catch (e) {
      debugPrint('Get All Users Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _getAllUsers() async {
    final Response response = await ApiServices().apiGetcall();

    if (response.statusCode == 200) {
      allUser.assignAll(
        UserDataModel.fromJsonList(
          response.data['users'],
        ),
      );
    }
  }

  Future<void> showUserDialog({
    required int id,
  }) async {
    final Response response =
    await ApiServices().getUserById(id: id);

    if (response.statusCode == 200) {
      onePersonData = UserDataModel.fromJson(
        response.data,
      );

      Get.dialog(
        UserInformationDialog(),
      );
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
