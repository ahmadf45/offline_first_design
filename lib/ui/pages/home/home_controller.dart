import 'package:offline_first_design/entities/product.dart';
import 'package:offline_first_design/infrastructures/app_components.dart';
import 'package:offline_first_design/infrastructures/base_controller.dart';
import 'package:offline_first_design/ui/pages/home/home_presenter.dart';

class HomeController extends BaseController {
  final HomePresenter _presenter = AppComponents.getInjector().get();

  List<Product> _listProduct = [];
  List<Product> get listProduct => _listProduct;

  @override
  void onInitState() {
    super.onInitState();
    showLoading();
    _getProducts();
  }

  @override
  void onInitListeners() {
    _initGetProducts();
    super.onInitListeners();
  }

  void _getProducts() {
    _presenter.onGetProducts();
  }

  void _initGetProducts() {
    _presenter.onComplete = () {
      dismissLoading();
    };
    _presenter.onSuccess = (data) async {
      _listProduct = data;
      refreshUI();
    };
    _presenter.onError = (e) {};
  }
}
