import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache_helper/cache_helper.dart';
import 'package:chef_app/features/home/home_cubit/cubit/home_cubit.dart';
import 'package:chef_app/features/auth/data/repository/auth_repo.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/menu/data/repository/menu_repo.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void initServiceLocator() {
  //cubits
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => ForgetPasswordCubit(sl()));
  sl.registerLazySingleton(() => HomeCubit());
  sl.registerLazySingleton(() => MenuCubit(sl()));

  //auth features
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => MenuRepository());
  //external
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
}
