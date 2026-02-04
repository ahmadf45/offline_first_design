import 'package:get_it/get_it.dart';

import 'di/controller_module.dart';
import 'di/mapper_module.dart';
import 'di/presenter_module.dart';
import 'di/repository_module.dart';
import 'di/root_module.dart';
import 'di/use_case_module.dart';

class AppComponents {
  static Future<void> init() async {
    GetIt injector = getInjector();
    await RootModule.init(injector);
    MapperModule.init(injector);
    RepositoryModule.init(injector);
    UseCaseModule.init(injector);
    PresenterModule.init(injector);
    ControllerModule.init(injector);
  }

  static GetIt getInjector() {
    return GetIt.I;
  }

  static Future<void> refresh() async {
    getInjector().reset();
    getInjector().resetLazySingleton();
    init();
  }
}
