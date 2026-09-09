import 'package:dio/dio.dart';
import 'package:finance_api_project/routes/app_routes.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../provider/api_services.dart';

class Splash_screenLogic extends GetxController {
  final GetStorage storage = GetStorage();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  void onReady() {
    super.onReady();
    navigateToNextPage();
  }

  void navigateToNextPage() {
    Future.delayed(const Duration(seconds: 2), () async {
      if (storage.read('isLoggedIn') ?? false) {
        await validUser();
      } else {
        Get.offAllNamed(AppRoutes.second_cover);
      }
    });
  }

  Future<void> validUser() async {
    try {
      String? user = await secureStorage.read(key: 'saved_username');
      String? pass = await secureStorage.read(key: 'saved_password');

      if (user != null && pass != null) {
        final Response data = await ApiServices().apiPostcall(username: user, password: pass);
        if (data.statusCode == 200) {
          Get.offAllNamed(AppRoutes.dashboard);
          return;
        }
      }
      await _clearSession();
    } catch (_) {
      await _clearSession();
    }
  }

  Future<void> _clearSession() async {
    await storage.write('isLoggedIn', false);
    await secureStorage.deleteAll();
    Get.offAllNamed(AppRoutes.second_cover);
  }
}


// void handleApiError(int? statusCode) {
//   final GetStorage storage = GetStorage();
//
//
//   if (statusCode == 401 || statusCode == 404) {
//     storage.write('isLoggedIn', false);
//     storage.remove('token');
//
//
//     Get.offAllNamed(AppRoutes.second_cover);
//   }
// }
//}
