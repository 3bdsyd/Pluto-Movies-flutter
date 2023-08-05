import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/logic/controllers/auth_controller.dart';
import 'package:movie_app/utils/text_utils.dart';

import '../widget/auth/button_sign_in_widget.dart';
import '../widget/auth/name_and_password_widget.dart';
import '../widget/auth/sign_in_with_google_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final authController = Get.find<AuthController>();
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
                            TextUtils.signUp,
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
                                      isLoginScreen: false,
                                      authController: authController,
                                    ),
                                    SizedBox(height: 30.h),
                                    ButtonSignInWidget(
                                      authController: authController,
                                      isLoginScreen: false, keyForm: keyForm,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 40.h,
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    const SignInWithGoogleWidget(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () =>
                                            Get.toNamed(TextUtils.loginScreen),
                                        child: Text(
                                          'I have an account',
                                          style:
                                              context.theme.textTheme.bodySmall,
                                        ),
                                      ),
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
