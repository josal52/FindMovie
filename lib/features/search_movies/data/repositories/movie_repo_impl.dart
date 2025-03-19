import 'package:yritys_app/features/search_movies/data/datasources/movie_data_source.dart';
import 'package:yritys_app/features/search_movies/data/models/movie_model.dart';
import 'package:yritys_app/features/search_movies/domain/entities/movie.dart';
import 'package:yritys_app/features/search_movies/domain/repositories/movie_repo.dart';

class MovieRepoImpl implements MovieRepo {
  final MovieDataSource dataSource;

  MovieRepoImpl(this.dataSource);

  List<Movie> movieModelList2MovieList(List<MovieModel> movieModelList) {
    List<Movie> movieList = [];

    for (int i = 0; i < movieModelList.length; i++) {
      MovieModel currentMovieModel = movieModelList[i];
      movieList.add(Movie(
          id: currentMovieModel.id,
          name: currentMovieModel.name,
          writers: currentMovieModel.writers,
          releaseYear: currentMovieModel.releaseYear));
    }

    return movieList;
  }

  @override
  Future<List<Movie>> searchMovies(String search) async {
    return movieModelList2MovieList(await dataSource.searchMovies(search));
  }

  @override
  Future<List<Movie>> searchFavoriteMovies(List<int> favoriteMoviesIds) async {
    return movieModelList2MovieList(
        await dataSource.searchFavoriteMovies(favoriteMoviesIds));
  }
}
