import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/cache_helper/cache_helper.dart';
import 'package:chef_app/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void initServiceLocator() {
  //cubits
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => LoginCubit());
  //external
  sl.registerLazySingleton(() => CacheHelper());
}
