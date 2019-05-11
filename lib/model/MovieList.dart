import 'Movie.dart';

class MovieList {
  final int resultCount;
  final List<Movie> results;

  MovieList({this.resultCount, this.results});

  factory MovieList.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Movie> movies = list.map((i) => Movie.fromJson(i)).toList();
    return MovieList(
      resultCount: json['resultCount'],
      results: movies,
    );
  }
}
