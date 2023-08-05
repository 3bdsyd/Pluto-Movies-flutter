import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/movies_model.dart';

import '../../services/Movies_services.dart';

class MoviesController extends GetxController {
  RxList<Result> moviesList = <Result>[].obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    moviesResults();
  }

  void moviesResults() async {
    isLoading(true);
    final MoviesModel getMovies = await MoviesServices.getMovies();
    final List<Result> getMoviesResults = getMovies.results;
    try {
      if (getMoviesResults.isNotEmpty) {
        moviesList.addAll(getMoviesResults);
        // print(moviesList[0].backdropPath); // test
      }
    } finally {
      isLoading(false);
    }
    update();
  }

  //----------------------------------------------------------------

  late Result resultDetails;
  void getMovieDetails(int id) {
    resultDetails = moviesList.firstWhere((element) => element.id == id);
    update();
  }

  //----------------------------------------------------------------

  RxList<Result> searchResult = <Result>[].obs;

  TextEditingController searchController = TextEditingController();

  void getSearchResult(String search) {
    searchResult(moviesList
        .where((element) =>
            element.title.toLowerCase().contains(search.toLowerCase()))
        .toList());
    update();
  }

  //----------------------------------------------------------------

  void searchClear() {
    searchController.clear();
    searchResult.clear();
    update();
  }
}
