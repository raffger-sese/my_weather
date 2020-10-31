import 'package:get_it/get_it.dart';
import 'package:my_weather/services/auth_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());
}
