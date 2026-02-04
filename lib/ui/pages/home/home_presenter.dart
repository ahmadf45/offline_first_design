import 'package:offline_first_design/entities/product.dart';
import 'package:offline_first_design/infrastructures/base_presenter.dart';
import 'package:offline_first_design/use_cases/product/get_product_use_case.dart';

class HomePresenter extends BasePresenter<List<Product>, Map<String, String>> {
  HomePresenter(GetProductsUseCase super._useCase);

  void onGetProducts() async {
    execute(request: {});
  }
}
