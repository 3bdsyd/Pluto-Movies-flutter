import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/utils/colors_utils.dart';

import '../../utils/text_utils.dart';
import '../../view/widget/snakbar_widget.dart';

class AuthController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RxBool isVisibility = false.obs;
  RxBool isLoadingSignUp = false.obs;

  RxBool isLoadingSignIn = false.obs;

  static final boxLogin = GetStorage();

  final TextEditingController signUpEmailController = TextEditingController();

  final TextEditingController signUpPasswordController =
      TextEditingController();

  final TextEditingController signInEmailController = TextEditingController();

  final TextEditingController signInPasswordController =
      TextEditingController();

  void visibilityChange() {
    isVisibility(!isVisibility.value);
    update();
  }

  void signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      isLoadingSignUp(true);
      isLoadingSignUp.value
          ? Get.dialog(
              Center(
                child: CircularProgressIndicator(
                  color: ColorsUtils.backgroundColor,
                ),
              ),
            )
          : null;
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      boxLogin.write(TextUtils.loginKey, true);
      Get.offAllNamed(TextUtils.homeScreen);
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'weak-password') {
        snackbarWidget(
          title: 'weak password',
          message: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        snackbarWidget(
          title: 'Email already in use',
          message: 'The account already exists for that email.',
        );
      }
    } catch (e) {
      Get.back();
      snackbarWidget(
        title: 'Error',
        message: e.toString(),
      );
    }
  }

  void signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      isLoadingSignIn(true);
      isLoadingSignIn.value
          ? Get.dialog(
              Center(
                child: CircularProgressIndicator(
                  color: ColorsUtils.backgroundColor,
                ),
              ),
            )
          : null;
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      boxLogin.write(TextUtils.loginKey, true);
      Get.toNamed(TextUtils.homeScreen);
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'user-not-found') {
        snackbarWidget(
          title: 'User not found',
          message: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        snackbarWidget(
          title: 'Wrong password',
          message: 'Wrong password provided for that user.',
        );
      }
    } catch (e) {
      Get.back();
      snackbarWidget(
        title: 'Error',
        message: e.toString(),
      );
    }
  }

  void signOut() async {
    boxLogin.write(TextUtils.loginKey, false);
    await firebaseAuth.signOut();
    Get.toNamed(TextUtils.loginScreen);
  }
}
