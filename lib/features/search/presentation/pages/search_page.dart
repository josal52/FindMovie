import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_bloc.dart';
import 'package:yritys_app/features/manage_favorites/presentation/bloc/favorites_event.dart';
import 'package:yritys_app/features/search/presentation/widgets/movie_list.dart';
import 'package:yritys_app/features/search/presentation/widgets/movie_search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();

    context.read<FavoritesBloc>().add(LoadFavoriteIds());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MovieSearchBar(),
          MovieList(),
        ],
      ),
    );
  }
}
