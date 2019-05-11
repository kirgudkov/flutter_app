import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model/MovieList.dart';

class Repository {
  static String url = 'https://itunes.apple.com/search?country=US&entity=movie&term=';

  static Future<MovieList> find(String searchString) async {
    final response  = await http.get('$url/${searchString ?? ' '}');
    return MovieList.fromJson(json.decode(response.body));
  }
}