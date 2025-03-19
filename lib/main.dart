import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yritys_app/core/network/supabase.dart';
import 'package:yritys_app/core/utils/local_storage.dart';
import 'package:yritys_app/core/widgets/bottomNavBar/bloc/bottom_nav_bar_cubit.dart';
import 'package:yritys_app/core/widgets/customAppBar/bloc/custom_app_bar_cubit.dart';
import 'package:yritys_app/features/favorites/presentation/bloc/favorite_movie_list_bloc.dart';
import 'package:yritys_app/features/manage_favorites/data/datasources/local_favorites_datasource.dart';
import 'package:yritys_app/features/manage_favorites/data/repositories/manage_favorites_repo_impl.dart';
import 'package:yritys_app/features/manage_favorites/domain/use_cases/get_favorite_ids.dart';
import 'package:yritys_app/features/manage_favorites/domain/use_cases/toggle_favorite_by_id.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_bloc.dart';
import 'package:yritys_app/features/search_movies/data/datasources/movie_data_source.dart';
import 'package:yritys_app/features/search_movies/data/repositories/movie_repo_impl.dart';
import 'package:yritys_app/features/search_movies/domain/use_cases/search_favorite_movies.dart';
import 'package:yritys_app/features/search_movies/domain/use_cases/search_movies.dart';
import 'package:yritys_app/features/search/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'routes/app_router.dart';

void main() async {
  // Init storages
  await SupabaseService.init();
  await LocalStorage.init();

  // Load initial data

  // Dependecy injection
  final movieDataSource = MovieDataSource();
  final movieRepo = MovieRepoImpl(movieDataSource);
  final searchMovies = SearchMovies(movieRepo);
  final searchFavoriteMovies = SearchFavoriteMovies(movieRepo);

  final localFavoritesDataSource = LocalFavoritesDataSource();
  final manageFavoritesRepo = ManageFavoritesRepoImpl(localFavoritesDataSource);
  final toggleFavoriteById = ToggleFavoriteById(manageFavoritesRepo);
  final getFavoriteIds = GetFavoriteIds(manageFavoritesRepo);

  // Bloc
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => BottomNavBarCubit(),
    ),
    BlocProvider(
      create: (_) => CustomAppBarCubit(),
    ),
    BlocProvider(
      create: (_) => FavoritesBloc(toggleFavoriteById, getFavoriteIds),
    ),
    BlocProvider(
      create: (_) => MovieListBloc(searchMovies),
    ),
    BlocProvider(
      create: (_) => FavoriteMovieListBloc(searchFavoriteMovies),
    ),
  ], child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'FindMovie',
    );
  }
}
