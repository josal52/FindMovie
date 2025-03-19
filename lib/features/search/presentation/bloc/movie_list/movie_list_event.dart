abstract class MovieListEvent {}

class SearchMoviePressed extends MovieListEvent {
  final String search;

  SearchMoviePressed(this.search);
}
