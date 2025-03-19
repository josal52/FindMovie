import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yritys_app/core/widgets/bottomNavBar/bottom_nav_bar.dart';
import 'package:yritys_app/core/widgets/customAppBar/bloc/custom_app_bar_cubit.dart';
import 'package:yritys_app/core/widgets/customAppBar/custom_app_bar.dart';
import 'package:yritys_app/features/search/presentation/pages/search_page.dart';
import 'package:yritys_app/features/favorites/presentation/pages/favorites_page.dart';

final GoRouter router = GoRouter(initialLocation: '/search', routes: [
  ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          appBar: CustomAppBar(),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
      routes: [
        GoRoute(
          path: '/search',
          builder: (context, state) {
            context.read<CustomAppBarCubit>().updateTitle('Search movies');
            return SearchPage();
          },
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            context.read<CustomAppBarCubit>().updateTitle('Your favorites');
            return const FavoritesPage();
          },
        )
      ])
]);
