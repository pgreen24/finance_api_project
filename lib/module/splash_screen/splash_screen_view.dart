import 'package:finance_api_project/utils/apps_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_screen_logic.dart';

class Splash_screenPage extends StatelessWidget {
  const Splash_screenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<Splash_screenLogic>();

    return Scaffold(
      backgroundColor: AppsColor.maincolor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/vector_copy.png',
                width: 109,
                height: 114.78,
              ),
              const SizedBox(height: 2),
              const Text(
                "FinWise",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 52.14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

