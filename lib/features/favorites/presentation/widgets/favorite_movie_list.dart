import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yritys_app/features/favorites/presentation/bloc/favorite_movie_list_bloc.dart';
import 'package:yritys_app/features/favorites/presentation/bloc/favorite_movie_list_state.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_bloc.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_event.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_state.dart';

class FavoriteMovieList extends StatelessWidget {
  const FavoriteMovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MovieList();
  }
}

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteMovieListBloc, FavoriteMovieListState>(
        builder: (context, favoriteMovieListState) {
      if (favoriteMovieListState is FavoriteMovieListLoaded) {
        if (favoriteMovieListState.favoriteMovieList.isNotEmpty) {
          return ListView.builder(
              itemCount: favoriteMovieListState.favoriteMovieList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.play_arrow_outlined),
                  trailing: GestureDetector(
                    onTap: () => context.read<FavoritesBloc>().add(
                        FavoriteMovieToggled(favoriteMovieListState
                            .favoriteMovieList[index].id)),
                    child: FavoritesIcon(
                      id: favoriteMovieListState.favoriteMovieList[index].id,
                    ),
                  ),
                  titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
                  title: Text(
                      '${favoriteMovieListState.favoriteMovieList[index].name} (${favoriteMovieListState.favoriteMovieList[index].releaseYear})'),
                  subtitle: Text(
                      (favoriteMovieListState.favoriteMovieList[index].writers)
                          .join(', ')),
                );
              });
        } else {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(22),
            child: Text('No favorites yet!'),
          ));
        }
      } else {
        return Center(child: CircularProgressIndicator());
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
