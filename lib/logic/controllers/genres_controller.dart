import 'package:get/get.dart';
import 'package:movie_app/logic/controllers/movies_controller.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/services/genres_services.dart';

class GenresController extends GetxController {
  final MoviesController moviesController = Get.put(MoviesController());

  final List<Genre> genresList = [];

  Map<Result, List<int>> filterResultMap = {};
  // ignore: prefer_final_fields
  List<Result> _filterResultList = <Result>[];
  List<Result> filterResultList = <Result>[].obs;
  List<bool> checkVal = [];

  final RxBool isLoading = true.obs;

  final RxBool isChecking = false.obs;

  void getGenres() async {
    if (genresList.isEmpty) {
      try {
        GenresModel genresModel = await GenresServices.genresServices();
        List<Genre> getGenresList = genresModel.genres;

        if (getGenresList.isNotEmpty) {
          genresList.addAll(getGenresList);
          checkVal = List.generate(genresList.length, (index) => false);
        }
      } finally {
        isLoading(false);
      }
    }
    // print(genresList.length);
    update();
  }

  void checkUpdate(int id, int index, bool check) async {
    checkVal[index] = check;
    if (check) {
      filterResultList.clear();
      _filterResultList.addAll(moviesController.moviesList
          .where((p0) => p0.genreIds.any((element) => element == id)));
      for (int i = 0; i < _filterResultList.length; i++) {
        var k = filterResultMap.containsKey(_filterResultList[i]);
        if (!k) {
          filterResultMap.addAll({
            _filterResultList[i]: [id]
          });
        } else {
          filterResultMap.update(_filterResultList[i], (value) {
            List<int> resultList = value;
            resultList.add(id);
            return resultList;
          });
        }
      }
      _filterResultList.clear();
    } else {
      var j = filterResultList
          .where((element) => element.genreIds.any((element) => element == id))
          .toList();
      for (int i = 0; i < j.length; i++) {
        filterResultMap.update(j[i], (value) {
          var f = value;
          f.removeWhere((element) => element == id);
          return f;
        });
      }

      filterResultMap.removeWhere((key, value) => value.isEmpty);
      filterResultList.clear();
    }
    filterResultList.addAll(filterResultMap.keys);
    filterResultList = filterResultList.toSet().toList();

    isChecking(true);
    print(filterResultMap);
    print(filterResultList.length);
    update();
  }

  // bool _isContainsTheElementFilter(int id) {
  //   return filterResultList
  //       .any((p0) => p0.genreIds.any((element) => element == id));
  // }

  void applyCheck() {
    isChecking(false);
    // filterResultList.addAll();
    // print(filterResultList.length);

    update();
  }
    void getSearchFilter(String search) {
    moviesController.searchResult(filterResultList
        .where((element) =>
            element.title.toLowerCase().contains(search.toLowerCase()))
        .toList());
    update();
  }
}
