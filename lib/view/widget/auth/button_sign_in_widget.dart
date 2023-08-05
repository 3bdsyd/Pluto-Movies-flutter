import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/colors_utils.dart';
import 'package:movie_app/utils/text_utils.dart';

import '../../../logic/controllers/auth_controller.dart';

// ignore: must_be_immutable
class ButtonSignInWidget extends StatelessWidget {
  const ButtonSignInWidget({
    super.key,
    required this.isLoginScreen,
    required this.authController,
    required this.keyForm,
  });

  final bool isLoginScreen;
  final AuthController authController;
  final GlobalKey<FormState> keyForm;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (_) {},
        ),
        Expanded(
          flex: 2,
          child: Text(
            TextUtils.rememberMe,
            style: context.theme.textTheme.labelMedium,
          ),
        ),
        Expanded(child: Container(),flex: 1,),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: () {
              if (isLoginScreen) {
                authController.signInWithEmail(
                    email: authController.signInEmailController.text,
                    password: authController.signInPasswordController.text);
              } else {
                if (keyForm.currentState!.validate()) {
                  authController.signUpWithEmail(
                    email: authController.signUpEmailController.text,
                    password: authController.signUpPasswordController.text,
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsUtils.backgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            child: Text(
             isLoginScreen? TextUtils.signIn: TextUtils.register,
              style: context.theme.textTheme.labelMedium,
            ),
          ),
        ),
      ],
    );
  }
}
