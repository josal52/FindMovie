import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yritys_app/features/search_movies/domain/entities/movie.dart';
import 'package:yritys_app/features/search_movies/domain/use_cases/search_favorite_movies.dart';
import 'favorite_movie_list_event.dart';
import 'favorite_movie_list_state.dart';

class FavoriteMovieListBloc
    extends Bloc<FavoriteMovieListEvent, FavoriteMovieListState> {
  final SearchFavoriteMovies searchFavoriteMovies;
  List<int> lastFavoriteIds = [];
  List<Movie> lastMovieList = [];

  FavoriteMovieListBloc(this.searchFavoriteMovies)
      : super(FavoriteMovieListLoading()) {
    // Event handling
    on<LoadFavoriteMovies>((event, emit) async {
      emit(FavoriteMovieListLoading());
      if (listEquals(lastFavoriteIds, event.favoriteMovieIds)) {
        emit(FavoriteMovieListLoaded(lastMovieList));
      } else if (event.favoriteMovieIds.isEmpty) {
        emit(FavoriteMovieListLoaded([]));
        lastFavoriteIds = [];
        lastMovieList = [];
      } else {
        final movieList = await searchFavoriteMovies(event.favoriteMovieIds);
        emit(FavoriteMovieListLoaded(movieList));
        lastFavoriteIds = event.favoriteMovieIds;
        lastMovieList = movieList;
      }
    });
  }
}
