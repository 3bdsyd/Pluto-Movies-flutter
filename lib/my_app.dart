import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/routes/routes.dart';
import 'package:movie_app/utils/text_utils.dart';
import 'package:movie_app/utils/theme_app.dart';

import 'logic/controllers/auth_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.light,
          getPages: Routes.getPages,
          initialRoute: AuthController.boxLogin.read<bool>(TextUtils.loginKey)??false
              ? TextUtils.homeScreen
              : TextUtils.splashScreen,
        );
      },
    );
  }
}
