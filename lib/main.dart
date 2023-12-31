import 'package:chef_app/app/app.dart';
import 'package:chef_app/core/bloc/bloc_observer.dart';
import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/cache_helper/cache_helper.dart';
import 'package:chef_app/features/home/home_cubit/cubit/home_cubit.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  initServiceLocator();
  await sl<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GlobalCubit>()..getCachedLang(),
        ),
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ForgetPasswordCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<MenuCubit>()..getAllChefMeals(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
