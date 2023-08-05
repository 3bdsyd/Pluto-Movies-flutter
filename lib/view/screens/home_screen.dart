import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/logic/controllers/auth_controller.dart';
import 'package:movie_app/logic/controllers/movies_controller.dart';

import '../../logic/controllers/genres_controller.dart';
import '../widget/home/search_widget.dart';
import '../widget/home/setting_widget.dart';
import '../widget/home/show_movies.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AuthController authController = Get.find<AuthController>();
  final MoviesController moviesController = Get.find<MoviesController>();
  final GenresController genresController = Get.find<GenresController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SettingWidget(authController: authController),
            SizedBox(
              height: 22.h,
            ),
            SearchWidget(moviesController: moviesController),
            SizedBox(
              height: 20.h,
            ),
            ShowMovies(
                moviesController: moviesController,
                genresController: genresController),
          ],
        ),
      ),
    );
  }
}
