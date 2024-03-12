import 'package:get_it/get_it.dart';
import 'package:milk_points/data/repositories/customer_repository.dart';
import 'package:milk_points/data/repositories/point_repository.dart';
import 'package:milk_points/domain/repository/customer_repository.dart';
import 'package:milk_points/domain/repository/point_repository.dart';

import '../presentation/routes/routes.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<AppRouter>(AppRouter());
  locator.registerLazySingleton<CustomerRepository>(
      () => CustomerRepositoryImpl());
  locator.registerLazySingleton<PointRepository>(() => PointRepositoryImpl());
}
