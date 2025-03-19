import 'package:yritys_app/features/manage_favorites/domain/repositories/manage_favorites_repo.dart';

class GetFavoriteIds {
  final ManageFavoritesRepo repository;

  GetFavoriteIds(this.repository);

  Future<List<int>> call() {
    return repository.getFavoriteIds();
  }
}
