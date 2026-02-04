import 'package:get_it/get_it.dart';
import 'package:offline_first_design/ui/pages/home/home_presenter.dart';

/// Declare dependency injection for Presenter
class PresenterModule {
  static void init(GetIt injector) {
    injector.registerFactory<HomePresenter>(() {
      return HomePresenter(injector.get());
    });
  }
}
