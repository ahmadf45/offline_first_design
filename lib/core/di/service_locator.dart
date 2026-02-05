import 'package:get_it/get_it.dart';
import 'package:offline_first_design/core/di/datasources_di.dart';
import 'package:offline_first_design/core/di/hive_di.dart';
import 'package:offline_first_design/core/di/network_di.dart';
import 'package:offline_first_design/core/di/repositories_di.dart';
import 'package:offline_first_design/core/di/usecases_di.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  await initHive();
  await initNetwork();
  await initDatasource();
  await initRepositories();
  await initUsecases();
}
