import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/text_utils.dart';

import '../../logic/controllers/auth_controller.dart';
import '../widget/auth/button_sign_in_widget.dart';
import '../widget/auth/name_and_password_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });
  final AuthController authController = Get.find<AuthController>();
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/login_image.png'),
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            TextUtils.login,
                            style: context.theme.textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 30, top: 30),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromARGB(255, 227, 248, 247),
                              Color.fromARGB(255, 129, 221, 198),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                          ),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 249, 253, 252),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: SingleChildScrollView(
                              child: Form(
                                key: keyForm,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    NameAndPasswordWidget(
                                      isLoginScreen: true,
                                      authController: authController,
                                    ),
                                    SizedBox(height: 40.h),
                                    ButtonSignInWidget(
                                      isLoginScreen: true,
                                      keyForm: keyForm, authController: authController,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
