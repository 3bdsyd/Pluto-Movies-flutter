import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/colors_utils.dart';

import '../../../logic/controllers/genres_controller.dart';
import '../../../logic/controllers/movies_controller.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
    required this.moviesController,
  });

  final MoviesController moviesController;
  final genresController = Get.put(GenresController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: GetBuilder<MoviesController>(
              builder: (_) {
                return TextField(
                  controller: moviesController.searchController,
                  onChanged: (element) {
                    genresController.filterResultList.isEmpty
                        ? moviesController.getSearchResult(element)
                        : genresController.getSearchFilter(element);
                  },
                  decoration: InputDecoration(
                    suffixIconColor: Colors.black,
                    suffixIcon:
                        moviesController.searchController.text.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  moviesController.searchClear();
                                },
                                icon: const Icon(Icons.clear),
                              )
                            : const Text(''),
                    contentPadding: const EdgeInsets.fromLTRB(
                      20.0,
                      15.0,
                      20.0,
                      15.0,
                    ),
                    hintText: 'search',
                    hintStyle: context.theme.textTheme.bodyMedium,
                    fillColor: const Color.fromARGB(179, 255, 255, 255),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(179, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(179, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(179, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(179, 255, 255, 255),
              foregroundColor: Colors.black,
              child: IconButton(
                onPressed: () {
                  genresController.getGenres();
                  moviesController.searchClear();
                  moviesController.searchResult.clear();
                  Get.generalDialog(
                    pageBuilder: (BuildContext buildContext,
                        Animation animation, Animation secondaryAnimation) {
                      return Column(
                        children: [
                          Expanded(flex: 1, child: Container()),
                          Expanded(
                            flex: 7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Scaffold(
                                body: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: GetBuilder(
                                        init: GenresController(),
                                        builder: (_) {
                                          return !genresController
                                                  .isLoading.value
                                              ? Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(),
                                                          Text(
                                                            'Filter',
                                                            style: context
                                                                .textTheme
                                                                .titleMedium,
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            icon: Icon(
                                                              Icons.clear,
                                                              color: ColorsUtils
                                                                  .mainColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                        color: ColorsUtils
                                                            .mainColor),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30.w),
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              'Year',
                                                              style: context
                                                                  .textTheme
                                                                  .titleLarge,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        moviesController
                                                                            .searchController,
                                                                    onChanged:
                                                                        (element) {
                                                                      genresController
                                                                              .filterResultList
                                                                              .isEmpty
                                                                          ? moviesController.getSearchResult(
                                                                              element)
                                                                          : genresController
                                                                              .getSearchFilter(element);
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                      suffixIconColor:
                                                                          Colors
                                                                              .black,
                                                                      suffixIcon: moviesController
                                                                              .searchController
                                                                              .text
                                                                              .isNotEmpty
                                                                          ? IconButton(
                                                                              onPressed: () {
                                                                                moviesController.searchClear();
                                                                              },
                                                                              icon: const Icon(Icons.clear),
                                                                            )
                                                                          : const Text(
                                                                              ''),
                                                                      contentPadding:
                                                                          const EdgeInsets
                                                                              .fromLTRB(
                                                                        20.0,
                                                                        15.0,
                                                                        20.0,
                                                                        15.0,
                                                                      ),
                                                                      hintText:
                                                                          'Enter Year',
                                                                      hintStyle: context
                                                                          .theme
                                                                          .textTheme
                                                                          .bodyMedium,
                                                                      fillColor: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                      filled:
                                                                          true,
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color: Color.fromARGB(
                                                                              179,
                                                                              219,
                                                                              215,
                                                                              215),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color: Color.fromARGB(
                                                                              179,
                                                                              233,
                                                                              227,
                                                                              227),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color: Color.fromARGB(
                                                                              179,
                                                                              236,
                                                                              231,
                                                                              231),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 4,
                                                                  child:
                                                                      Container(),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 25.h,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              'Genres',
                                                              style: context
                                                                  .textTheme
                                                                  .titleLarge,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 10.w,
                                                        ),
                                                        child: GridView.builder(
                                                          itemCount:
                                                              genresController
                                                                  .genresList
                                                                  .length,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            childAspectRatio:
                                                                2.h,
                                                            crossAxisCount: 2,
                                                          ),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Container(
                                                              // height: 20,

                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child:
                                                                  CheckboxListTile(
                                                                activeColor:
                                                                    ColorsUtils
                                                                        .mainColor,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .leading,
                                                                value: genresController
                                                                        .checkVal[
                                                                    index],
                                                                onChanged:
                                                                    (val) {
                                                                  genresController
                                                                      .checkUpdate(
                                                                    genresController
                                                                        .genresList[
                                                                            index]
                                                                        .id,
                                                                    index,
                                                                    val!,
                                                                  );
                                                                },
                                                                title: Text(
                                                                  genresController
                                                                      .genresList[
                                                                          index]
                                                                      .name,
                                                                  style: context
                                                                      .textTheme
                                                                      .titleMedium,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    genresController
                                                            .isChecking.value
                                                        ? Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    Container(),
                                                              ),
                                                              Expanded(
                                                                flex: 8,
                                                                child: SizedBox(
                                                                  height: 40.h,
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      genresController
                                                                          .applyCheck();
                                                                      Get.back();
                                                                    },
                                                                    child: Text(
                                                                      'Apply',
                                                                      style: context
                                                                          .textTheme
                                                                          .titleMedium,
                                                                    ),
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(18),
                                                                      ),
                                                                      backgroundColor:
                                                                          ColorsUtils
                                                                              .backgroundColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    Container(),
                                                              ),
                                                            ],
                                                          )
                                                        : Container(),
                                                    SizedBox(
                                                      height: 10.h,
                                                    )
                                                  ],
                                                )
                                              : Container();
                                        })),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.filter_alt_outlined),
              ),
            ),
          ),
          // genresController.isChecking.value?CircleAvatar(
          //   backgroundColor: const Color.fromARGB(179, 255, 255, 255),
          //   foregroundColor: Colors.black,
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.clear,
          //     ),
          //   ),
          // ):const Text(''),
        ],
      ),
    );
  }
}
