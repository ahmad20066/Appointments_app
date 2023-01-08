import 'package:appointments/common/local/local_repo.dart';
import 'package:appointments/features/experts/services/experts_service.dart';
import 'package:appointments/features/profile/services/user_services.dart';
import 'package:get_it/get_it.dart';

import 'features/experts/services/category_service.dart';

final locator = GetIt.instance;
void setUp() {
  locator.registerLazySingleton<CategoryService>(() => CategoryService());
  locator.registerLazySingleton<LocalRepo>(() => LocalRepo());
  locator.registerLazySingleton<ExpertsService>(() => ExpertsService());
  locator.registerLazySingleton<UserServices>(() => UserServices());
}
