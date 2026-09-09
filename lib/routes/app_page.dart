import 'package:finance_api_project/routes/app_routes.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';

import '../module/dashboard/dashboard_binding.dart';
import '../module/dashboard/dashboard_view.dart';
import '../module/login/login_binding.dart';
import '../module/login/login_view.dart';
import '../module/second_cover/second_cover_binding.dart';
import '../module/second_cover/second_cover_view.dart';
import '../module/splash_screen/splash_screen_binding.dart';
import '../module/splash_screen/splash_screen_view.dart';
class AppPage {
  static final initial = AppRoutes.splash_screen;
  static final routes = [
    GetPage(name: AppRoutes.splash_screen,
        page: () => Splash_screenPage(),
        bindings: [Splash_screenBinding()]),
    GetPage(name: AppRoutes.second_cover,
        page: () => Second_coverPage(),
        bindings: [Second_coverBinding()]),
    GetPage(name: AppRoutes.login,
        page: () => LoginPage(),
        bindings: [LoginBinding()]),
    GetPage(name: AppRoutes.dashboard,
        page: () => DashboardPage(),
        bindings: [DashboardBinding()]),
  ];
}


