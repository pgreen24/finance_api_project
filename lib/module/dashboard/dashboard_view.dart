import 'package:finance_api_project/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'hide Response;
import 'package:get_storage/get_storage.dart';

import '../../utils/apps_color.dart';
import 'dashboard_logic.dart';

class DashboardPage extends GetView<DashboardLogic> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: AppsColor.maincolor),
              child: const Text(
                'user Logout',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.logout),
              title:const Text('Logout') ,
              onTap: () async {
                final GetStorage storage = GetStorage();
                await storage.remove('isLoggedIn');
                await storage.remove('userData');
                Get.offAllNamed(AppRoutes.login);
              },
            )
          ],
        ),
      ),

      body: Obx(
        () => controller.isLoading.isFalse
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  TabBar(
                    tabs: controller.tab,
                    controller: controller.tabController,
                  ),

                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                margin: const EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(60),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      Container(
                                        width: 80,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              controller.userData['image'] ??
                                                  'N/A',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 15),

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [

                                            RichText(
                                              text: TextSpan(
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                                children: [
                                                  const TextSpan(
                                                    text: 'Name: ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: controller
                                                        .userData['name']??'N/A',
                                                  ),
                                                ],
                                              ),
                                            ),

                                            const SizedBox(height: 8),

                                            RichText(
                                              text: TextSpan(
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                                children: [
                                                  const TextSpan(
                                                    text: 'Email: ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: controller
                                                        .userData['email']??'N/A',
                                                  ),
                                                ],
                                              ),
                                            ),

                                            const SizedBox(height: 8),

                                            RichText(
                                              text: TextSpan(
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                                children: [
                                                  const TextSpan(
                                                    text: 'Gender: ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: controller
                                                        .userData['gender']??'N/A',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),

                        Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                            itemCount: controller.allUser.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(color: Colors.amberAccent),
                            itemBuilder: (context, index) {
                              final user = controller.allUser[index];

                              return ListTile(
                                title: Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Name: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: user.firstName),
                                    ],
                                  ),
                                ),

                                subtitle: Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Gender: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: user.gender),
                                    ],
                                  ),
                                ),

                                onTap: () {
                                  controller.showUserDialog(id: user.id);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
