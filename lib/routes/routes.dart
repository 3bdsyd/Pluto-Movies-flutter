import 'package:get/get.dart';
import 'package:movie_app/logic/bindings/auth_binding.dart';
import 'package:movie_app/logic/bindings/genres_binding.dart';
import 'package:movie_app/utils/text_utils.dart';
import 'package:movie_app/view/screens/sign_up_screen.dart';
import 'package:movie_app/view/screens/splash_screen.dart';

import '../logic/bindings/movies_binding.dart';
import '../view/screens/details_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/login_screen.dart';

class Routes {
  static const splashScreen = TextUtils.splashScreen;
  static final List<GetPage> getPages = [
    GetPage(
      name: TextUtils.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: TextUtils.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: TextUtils.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: TextUtils.homeScreen,
      page: () => HomeScreen(),
      bindings: [
        AuthBinding(),
        MoviesBinding(),
        GenresBinding(),
      ],
    ),
    GetPage(
      name: TextUtils.detailsScreen,
      page: () => DetailsScreen(),
    ),
  ];
}
