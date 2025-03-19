class FavoritesState {}

class FavoriteMovieIdsLoaded extends FavoritesState {
  final List<int> favoriteMovieIds;

  FavoriteMovieIdsLoaded(this.favoriteMovieIds);
}

class FavoriteMovieIdsLoading extends FavoritesState {}
