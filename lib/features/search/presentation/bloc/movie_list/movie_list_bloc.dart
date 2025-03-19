import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yritys_app/features/search_movies/domain/use_cases/search_movies.dart';
import 'movie_list_event.dart';
import 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final SearchMovies searchMovies;

  MovieListBloc(this.searchMovies) : super(MovieListState([])) {
    on<SearchMoviePressed>(
      (event, emit) async {
        final movieList = await searchMovies(event.search);
        emit(MovieListState(movieList));
      },
    );
  }
}
