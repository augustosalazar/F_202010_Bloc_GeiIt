import 'package:get_it/get_it.dart';
import 'bloc_pattern/auth_bloc.dart';
import 'bloc_pattern/course_bloc.dart';
import 'services/api.dart';
import 'services/authentication_service.dart';
import 'services/couses_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() =>   CourseService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => CourseBloc());
  locator.registerLazySingleton(() => AuthBloc());
}
