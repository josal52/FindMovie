import 'package:yritys_app/features/search_movies/domain/entities/movie.dart';

abstract class MovieRepo {
  Future<List<Movie>> searchMovies(String search);
  Future<List<Movie>> searchFavoriteMovies(List<int> favoriteMoviesIds);
}
