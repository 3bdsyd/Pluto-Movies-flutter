import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/text_utils.dart';

import '../../../logic/controllers/auth_controller.dart';
import 'form_field_widget.dart';

// ignore: must_be_immutable
class NameAndPasswordWidget extends StatelessWidget {
  const NameAndPasswordWidget({
    super.key,
    required this.isLoginScreen,
    required this.authController,
  });

  final bool isLoginScreen;

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Username',
            style: context.theme.textTheme.labelLarge,
          ),
        ),
        FromFieldWidget(
          isEmail: true,
          validator: (value) {
            if (!RegExp(TextUtils.emailValid).hasMatch(value)) {
              return 'Enter a Valid Email Address';
            } else {
              return null;
            }
          },
          controller: isLoginScreen
              ? authController.signInEmailController
              : authController.signUpEmailController,
          hintText: isLoginScreen ? '' : 'EX: Abdulrahman', authController: authController,
        ),
        SizedBox(
          height: 30.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Password',
            style: context.theme.textTheme.labelLarge,
          ),
        ),
        FromFieldWidget(
          isEmail: false,
          validator: (value) {
            if (value.toString().isEmpty ||
                !RegExp(TextUtils.passwordValid).hasMatch(value)) {
              return 'Enter valid password';
            } else {
              return null;
            }
          },
          controller: isLoginScreen
              ? authController.signInPasswordController
              : authController.signUpPasswordController,
          hintText: isLoginScreen ? '' : 'EX: pa#dd1*23', authController: authController,
        ),
        SizedBox(height: 15.h),
        isLoginScreen
            ? Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forgot Password?',
                  style: context.theme.textTheme.labelSmall,
                ),
              )
            : Container(),
      ],
    );
  }
}
