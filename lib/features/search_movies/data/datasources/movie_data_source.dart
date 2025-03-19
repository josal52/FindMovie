import 'package:yritys_app/core/network/supabase.dart';
import 'package:yritys_app/features/search_movies/data/models/movie_model.dart';

class MovieDataSource {
  List<MovieModel> response2MovieModelList(final response) {
    List<MovieModel> movieModelList = [];

    for (int i = 0; i < response.length; i++) {
      movieModelList.add(MovieModel.fromJson(response[i]));
    }

    return movieModelList;
  }

  final supabase = SupabaseService.client;

  Future<List<MovieModel>> searchMovies(String search) async {
    final response =
        await supabase.from('movies').select().ilike('name', '%$search%');

    return response2MovieModelList(response);
  }

  Future<List<MovieModel>> searchFavoriteMovies(
      List<int> favoriteMoviesIds) async {
    final response = await supabase
        .from('movies')
        .select()
        .filter('id', 'in', '(${favoriteMoviesIds.join(',')})');

    return response2MovieModelList(response);
  }
}
