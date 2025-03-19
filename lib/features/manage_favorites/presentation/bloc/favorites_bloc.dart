import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yritys_app/features/manage_favorites/domain/use_cases/get_favorite_ids.dart';
import 'package:yritys_app/features/manage_favorites/domain/use_cases/toggle_favorite_by_id.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final ToggleFavoriteById toggleFavoriteById;
  final GetFavoriteIds getFavoriteIds;

  FavoritesBloc(this.toggleFavoriteById, this.getFavoriteIds)
      : super(FavoriteMovieIdsLoading()) {
    // Event handling
    on<LoadFavoriteIds>(
      (event, emit) async {
        emit(FavoriteMovieIdsLoaded(await getFavoriteIds()));
      },
    );
    on<FavoriteMovieToggled>(
      (event, emit) async {
        await toggleFavoriteById(event.movieId);
        emit(FavoriteMovieIdsLoaded(await getFavoriteIds()));
      },
    );
  }
}
