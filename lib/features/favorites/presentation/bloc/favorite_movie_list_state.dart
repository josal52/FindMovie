import 'package:yritys_app/features/search_movies/domain/entities/movie.dart';

class FavoriteMovieListState {}

class FavoriteMovieListLoaded extends FavoriteMovieListState {
  final List<Movie> favoriteMovieList;

  FavoriteMovieListLoaded(this.favoriteMovieList);
}

class FavoriteMovieListLoading extends FavoriteMovieListState {}
