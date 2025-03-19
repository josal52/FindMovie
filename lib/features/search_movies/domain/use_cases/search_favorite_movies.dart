import 'package:yritys_app/features/search_movies/domain/entities/movie.dart';
import 'package:yritys_app/features/search_movies/domain/repositories/movie_repo.dart';

class SearchFavoriteMovies {
  final MovieRepo repository;

  SearchFavoriteMovies(this.repository);

  Future<List<Movie>> call(List<int> favoriteMoviesIds) {
    return repository.searchFavoriteMovies(favoriteMoviesIds);
  }
}
