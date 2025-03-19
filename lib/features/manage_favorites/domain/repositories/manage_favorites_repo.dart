abstract class ManageFavoritesRepo {
  Future<List<int>> toggleFavoriteById(int id);
  Future<List<int>> getFavoriteIds();
}
