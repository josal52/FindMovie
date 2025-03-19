abstract class FavoritesEvent {}

class FavoriteMovieToggled extends FavoritesEvent {
  final int movieId;

  FavoriteMovieToggled(this.movieId);
}

class LoadFavoriteIds extends FavoritesEvent {}
