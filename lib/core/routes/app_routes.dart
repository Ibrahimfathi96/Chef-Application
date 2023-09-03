import 'package:chef_app/features/auth/presentation/screens/change_lang_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/login_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/send_code_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/add_meal_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/menu_home_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/change_password_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/profile_home_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/settings_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String changeLang = '/changeLang';
  static const String sendCode = '/sendCode';
  static const String resetPassword = '/resetPassword';
  static const String menuHome = '/menuHome';
  static const String addMeal = '/addMeal';
  static const String profileHome = '/profileHome';
  static const String updateProfile = '/updateProfile';
  static const String settings = '/settings';
  static const String changePassword = '/changePassword';
}

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.changeLang:
        return MaterialPageRoute(
          builder: (_) => const ChangeLanguageScreen(),
        );
      case Routes.sendCode:
        return MaterialPageRoute(
          builder: (_) => const SendCodeScreen(),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );
      case Routes.menuHome:
        return MaterialPageRoute(
          builder: (_) => const MenuHomeScreen(),
        );
      case Routes.addMeal:
        return MaterialPageRoute(
          builder: (_) => const AddMealScreen(),
        );
      case Routes.profileHome:
        return MaterialPageRoute(
          builder: (_) => const ProfileHomeScreen(),
        );
      case Routes.updateProfile:
        return MaterialPageRoute(
          builder: (_) => const UpdateProfileScreen(),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("This is Wrong Route."),
            ),
          ),
        );
    }
  }
}
