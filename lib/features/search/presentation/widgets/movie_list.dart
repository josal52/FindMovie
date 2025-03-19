import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yritys_app/features/search/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_bloc.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_event.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_state.dart';
import 'package:yritys_app/features/search/presentation/bloc/movie_list/movie_list_state.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, movieListState) {
      if (movieListState.movieList.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.only(top: 100),
          child: ListView.builder(
              itemCount: movieListState.movieList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.play_arrow_outlined),
                  trailing: GestureDetector(
                    onTap: () => context.read<FavoritesBloc>().add(
                        FavoriteMovieToggled(
                            movieListState.movieList[index].id)),
                    child: FavoritesIcon(
                      id: movieListState.movieList[index].id,
                    ),
                  ),
                  titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
                  title: Text(
                      '${movieListState.movieList[index].name} (${movieListState.movieList[index].releaseYear})'),
                  subtitle: Text(
                      (movieListState.movieList[index].writers).join(', ')),
                );
              }),
        );
      } else {
        return Center(child: Text('Search movie to see results!'));
      }
    });
  }
}

class FavoritesIcon extends StatelessWidget {
  final int id;

  const FavoritesIcon({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, favoritesState) {
      if (favoritesState is FavoriteMovieIdsLoaded) {
        if (favoritesState.favoriteMovieIds.contains(id)) {
          return Icon(Icons.favorite);
        }
      }
      return Icon(Icons.favorite_border);
    });
  }
}
