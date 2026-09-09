import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../dashboard_logic.dart';


class UserInformationDialog extends GetView<DashboardLogic> {
  const UserInformationDialog({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('User Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ID: ${controller.onePersonData.id}'),
          Text('Name: ${controller.onePersonData.fullName}'),
          Text('Gender: ${controller.onePersonData.gender}'),
          Text('Email: ${controller.onePersonData.email}'),

        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}