
import 'package:finance_api_project/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init('app_data');

  // if(!Platform.isWindows) {
  //   await GetStorage.init();
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance Management Mobile App',
      initialRoute: AppPage.initial,
      getPages: AppPage.routes,
    );
  }
}

