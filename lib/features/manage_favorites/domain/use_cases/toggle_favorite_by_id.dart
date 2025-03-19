import 'package:yritys_app/features/manage_favorites/domain/repositories/manage_favorites_repo.dart';

class ToggleFavoriteById {
  final ManageFavoritesRepo repository;

  ToggleFavoriteById(this.repository);

  Future<List<int>> call(int id) {
    return repository.toggleFavoriteById(id);
  }
}
