import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chef-Application',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: getAppTheme(),
    );
  }
}
