import 'package:hive_ce/hive_ce.dart';
import 'package:offline_first_design/data/models/product_model.dart';
import 'service_locator.dart';

Future<void> initHive() async {
  // --- HIVE BOX ---
  final productBox = await Hive.openBox<ProductModel>('products');

  sl.registerLazySingleton<Box<ProductModel>>(() => productBox);
}
