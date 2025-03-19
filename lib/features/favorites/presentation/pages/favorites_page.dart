import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yritys_app/features/favorites/presentation/bloc/favorite_movie_list_bloc.dart';
import 'package:yritys_app/features/favorites/presentation/bloc/favorite_movie_list_event.dart';
import 'package:yritys_app/features/favorites/presentation/widgets/favorite_movie_list.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_bloc.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_state.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    final state = context.read<FavoritesBloc>().state;
    if (state is FavoriteMovieIdsLoaded) {
      context
          .read<FavoriteMovieListBloc>()
          .add(LoadFavoriteMovies(state.favoriteMovieIds));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FavoriteMovieList(),
    );
  }
}
