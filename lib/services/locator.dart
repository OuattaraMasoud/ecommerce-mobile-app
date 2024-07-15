import 'package:e_commerce_project/global_app/global_app.dart';
import 'package:e_commerce_project/shared/network/api.dart';
import 'package:get_it/get_it.dart';

import '../screens/auth/repositories/repositories.dart';
import 'services.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
  var localStorageInstance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(localStorageInstance);
  var apiInterceptor = ApiIntercetor();
  apiInterceptor.initApiService();
  locator.registerSingleton<ApiIntercetor>(apiInterceptor);

  locator.registerSingleton<AuthRepository>(AuthRepository());
  locator.registerLazySingleton(() => NavigationService());

  locator.registerSingleton<GlobalAppCubit>(GlobalAppCubit());
}
