import 'package:yritys_app/features/manage_favorites/data/datasources/local_favorites_datasource.dart';
import 'package:yritys_app/features/manage_favorites/domain/repositories/manage_favorites_repo.dart';

class ManageFavoritesRepoImpl implements ManageFavoritesRepo {
  LocalFavoritesDataSource localDataSource;

  ManageFavoritesRepoImpl(this.localDataSource);

  @override
  Future<List<int>> toggleFavoriteById(int id) async {
    List<int> favoritesList = await localDataSource.getFavoritesList();

    if (favoritesList.contains(id)) {
      favoritesList.removeWhere((indexId) => indexId == id);
    } else {
      favoritesList.add(id);
    }

    localDataSource.setFavoritesList(favoritesList);

    return favoritesList;
  }

  @override
  Future<List<int>> getFavoriteIds() async {
    return await localDataSource.getFavoritesList();
  }
}
