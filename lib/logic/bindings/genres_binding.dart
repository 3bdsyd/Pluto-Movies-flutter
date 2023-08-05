import 'package:get/get.dart';
import 'package:movie_app/logic/controllers/genres_controller.dart';

class GenresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenresController());
  }
}
