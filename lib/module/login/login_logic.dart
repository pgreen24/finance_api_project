import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../provider/api_services.dart';
import '../../routes/app_routes.dart';

class LoginLogic extends GetxController {
  final RxBool isObscureText = true.obs;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GetStorage storage = GetStorage();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> logInApiCall() async {
    final String user = usernameController.text.trim();
    final String pass = passwordController.text.trim();
    print("*******************");
    print("username: $user");
    print("password: $pass");

    final Response data = await ApiServices().apiPostcall(username: user, password: pass);

    if (data.statusCode == 200) {

      await storage.write('isLoggedIn', true);
      await storage.write('userData', {
        'name': data.data['firstName'],
        'email': data.data['email'],
        'image': data.data['image'],
        'gender': data.data['gender'],
        'phone': data.data['phone'],
      });

      await secureStorage.write(key: 'saved_username', value: user);
      await secureStorage.write(key: 'saved_password', value: pass);
      await secureStorage.write(key: 'user_id', value: data.data['id'].toString());

      Get.offAllNamed(AppRoutes.dashboard);
    }
  }
}
