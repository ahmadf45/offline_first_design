import 'package:get_it/get_it.dart';
import 'package:offline_first_design/ui/pages/home/home_controller.dart';

/// Declare dependency injection for Controller
class ControllerModule {
  static void init(GetIt injector) {
    injector.registerFactory<HomeController>(() {
      return HomeController();
    });
  }
}
