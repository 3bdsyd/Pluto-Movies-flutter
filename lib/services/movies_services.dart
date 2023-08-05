import 'package:http/http.dart' as http;
import 'package:movie_app/models/movies_model.dart';

import '../utils/text_utils.dart';

class MoviesServices {
  static Future<MoviesModel> getMovies() async {
    // ignore: unused_local_variable
    final response = await http.get(
      Uri.parse(
          '${TextUtils.baseUrl}/3/discover/movie?api_key=61222fdc8669a6536695abd204a053a8&language=en&page=1&sort_by=popularity.desc'),
    );

    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      final String dataJson = response.body;
      return  moviesModelFromJson(dataJson);
    } else {     
      // print('error in response');
      return throw Exception();
    }
    
  }
}
