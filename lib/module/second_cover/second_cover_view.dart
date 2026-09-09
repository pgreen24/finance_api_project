import 'package:finance_api_project/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/apps_color.dart';
import '../login/login_view.dart';
import 'second_cover_logic.dart';

class Second_coverPage extends StatelessWidget {
  const Second_coverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<Second_coverLogic>();
    return Scaffold(
        backgroundColor:AppsColor.secondcolor,
        body: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/vector_1.png',
                  width: 109,
                  height: 114.74,
                ),
                const SizedBox(height: 2),
                Text(
                  "FinWise",
                  style: TextStyle(
                    color: AppsColor.maincolor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,

                  ),

                ),
                const SizedBox(height: 2),
                SizedBox(
                  width: 236,
                  height: 26,
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500,


                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: ()
                {
                  Get.offAllNamed(AppRoutes.login);

                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:AppsColor.maincolor,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(207, 45),
                  ),
                  child: Text('Log In'),
                ),

              ],
            ),
          ),
        ),



    );
  }
}
