import 'package:yritys_app/core/utils/local_storage.dart';

class LocalFavoritesDataSource {
  final prefs = LocalStorage.prefs;

  Future<List<int>> getFavoritesList() async {
    List<String>? favoritesStringList =
        prefs.getStringList('favorite_movie_ids');
    if (favoritesStringList == null) return [];
    // Converting List<String> to List<int>
    List<int> favoritesList = [];
    for (int i = 0; i < favoritesStringList.length; i++) {
      favoritesList.add(int.parse(favoritesStringList[i]));
    }
    return favoritesList;
  }

  Future<void> setFavoritesList(List<int> favoritesList) async {
    // Converting List<int> to List<String>
    List<String> favoritesStringList = [];
    for (int i = 0; i < favoritesList.length; i++) {
      favoritesStringList.add(favoritesList[i].toString());
    }
    prefs.setStringList('favorite_movie_ids', favoritesStringList);
  }
}
