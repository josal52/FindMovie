abstract class FavoriteMovieListEvent {}

class LoadFavoriteMovies extends FavoriteMovieListEvent {
  final List<int> favoriteMovieIds;

  LoadFavoriteMovies(this.favoriteMovieIds);
}
