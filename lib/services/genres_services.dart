import 'package:http/http.dart' as http;
import 'package:movie_app/utils/text_utils.dart';

import '../models/genres_model.dart';

class GenresServices {
  static Future<GenresModel> genresServices() async {
    final response = await http.get(
      Uri.parse(
          '${TextUtils.baseUrl}/3/genre/movie/list?api_key=61222fdc8669a6536695abd204a053a8&language=en'),
    );
    if (response.statusCode == 200) {
      final String dateJson = response.body;
      return genresModelFromJson(dateJson);
    } else {
      throw Exception();
    }
  }
}
