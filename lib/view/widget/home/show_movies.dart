import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/colors_utils.dart';
import 'package:movie_app/utils/text_utils.dart';

import '../../../logic/controllers/genres_controller.dart';
import '../../../logic/controllers/movies_controller.dart';
import '../../../utils/platform_utils.dart';

class ShowMovies extends StatelessWidget {
  const ShowMovies({
    super.key,
    required this.moviesController,
    required this.genresController,
  });

  final MoviesController moviesController;
  final GenresController genresController;
  @override
  Widget build(BuildContext context) {
    final int platformWidth = PlatformUtils.getSizeWidth(context).toInt();
    return Obx(() => moviesController.isLoading.value
        ? Center(
            child: CircularProgressIndicator(
              color: ColorsUtils.mainColor,
            ),
          )
        : Expanded(
            flex: 5,
            child: Container(
              color: const Color.fromARGB(179, 255, 255, 255),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: moviesController.searchController.text.isNotEmpty &&
                        moviesController.searchResult.isEmpty
                    ? Container()
                    : GridView.builder(
                        itemCount: moviesController.searchResult.isNotEmpty
                            ? moviesController.searchResult.length
                            : genresController.filterResultList.isNotEmpty &&
                                    !genresController.isChecking.value
                                ? genresController.filterResultList.length
                                : moviesController.moviesList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getNumberOfGrid(platformWidth),
                          mainAxisSpacing: 15.h,
                          crossAxisSpacing: 6.w,
                          childAspectRatio: .489.h,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              moviesController.getMovieDetails(
                                moviesController.searchResult.isNotEmpty
                                    ? moviesController.searchResult[index].id
                                    : genresController.filterResultList.isEmpty
                                        ? moviesController.moviesList[index].id
                                        : genresController
                                            .filterResultList[index].id,
                              );
                              Get.toNamed(TextUtils.detailsScreen);
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    '${TextUtils.baseUrlImage}${moviesController.searchResult.isNotEmpty ? moviesController.searchResult[index].posterPath : genresController.filterResultList.isEmpty ? moviesController.moviesList[index].posterPath : genresController.filterResultList[index].posterPath}',
                                    // width: double.infinity,
                                    // height: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RatingBarIndicator(
                                          rating: (moviesController
                                                      .searchResult.isNotEmpty
                                                  ? moviesController
                                                      .searchResult[index]
                                                      .voteAverage
                                                  : genresController
                                                          .filterResultList
                                                          .isEmpty
                                                      ? moviesController
                                                          .moviesList[index]
                                                          .voteAverage
                                                      : genresController
                                                          .filterResultList[
                                                              index]
                                                          .voteAverage) /
                                              2,
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Text(
                                          moviesController
                                                  .searchResult.isNotEmpty
                                              ? moviesController
                                                  .searchResult[index].title
                                              : genresController
                                                      .filterResultList.isEmpty
                                                  ? moviesController
                                                      .moviesList[index].title
                                                  : genresController
                                                      .filterResultList[index]
                                                      .title,
                                          style: context
                                              .theme.textTheme.labelLarge,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ));
    //  GetBuilder(
    //     init: MoviesController(),
    //     builder: (_) {
    //       return
    //     });
  }

  int getNumberOfGrid(int platformWidth) {
    if (platformWidth < 400) {
      return 2;
    } else if (platformWidth < 600) {
      return 3;
    } else if (platformWidth < 800) {
      return 4;
    }
    return 5;
  }
}
