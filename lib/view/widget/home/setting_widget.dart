import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/text_utils.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key,
    required this.authController,
  });
  final AuthController authController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Text(
          TextUtils.appName,
          style: context.theme.textTheme.titleLarge,
        ),
        IconButton(
          onPressed: () {
            authController.signOut();
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ],
    );
  }
}
