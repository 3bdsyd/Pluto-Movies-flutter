
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/colors_utils.dart';

// ignore: must_be_immutable
class FromFieldWidget extends StatelessWidget {
  const FromFieldWidget({
    super.key,
    required this.isEmail,
    required this.validator,
    required this.controller,
    required this.hintText,
    required this.authController,
  });
  final AuthController authController;
  final bool isEmail;

  final Function(dynamic value) validator;

  final TextEditingController controller;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: AuthController(),
      builder:
      (_) => TextFormField(
        controller: controller,
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        validator: (value) => validator(value),
        style: context.theme.textTheme.labelMedium,
        obscureText:isEmail? false: !authController.isVisibility.value,
        decoration: InputDecoration(
          suffixIconColor: ColorsUtils.backgroundColor,
          hintText: hintText,
          hintStyle: context.theme.textTheme.bodyMedium,
          suffixIcon: isEmail
              ? const Text('')
              : IconButton(
                  onPressed: () {
                    authController.visibilityChange();
                  },
                  icon: Icon(
                    authController.isVisibility.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorsUtils.backgroundColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorsUtils.backgroundColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
