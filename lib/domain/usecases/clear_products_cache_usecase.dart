import 'package:offline_first_design/core/results/results.dart';
import 'package:offline_first_design/data/repositories/product_repository.dart';

class ClearProductsCacheUsecase {
  final ProductRepository repository;

  ClearProductsCacheUsecase(this.repository);

  Future<Result<void>> call() {
    return repository.clearLocalCache();
  }
}
