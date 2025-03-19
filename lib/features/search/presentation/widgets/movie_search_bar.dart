import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yritys_app/features/search/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:yritys_app/features/search/presentation/bloc/movie_list/movie_list_event.dart';

class MovieSearchBar extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  MovieSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(10, 0, 0, 0),
              blurRadius: 40,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Enter movie name',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          onSubmitted: (controller) async {
            if (controller.isNotEmpty) {
              context.read<MovieListBloc>().add(SearchMoviePressed(controller));
            }
          },
        ),
      ),
    );
  }
}
