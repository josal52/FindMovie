import 'package:yritys_app/features/search_movies/domain/entities/movie.dart';
import 'package:yritys_app/features/search_movies/domain/repositories/movie_repo.dart';

class SearchMovies {
  final MovieRepo repository;

  SearchMovies(this.repository);

  Future<List<Movie>> call(String search) {
    return repository.searchMovies(search);
  }
}
