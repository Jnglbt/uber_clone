import 'package:flutter/material.dart';
import 'package:uber_clone/presentation/screens/browse/browse_by_category.dart';
import 'package:uber_clone/presentation/screens/screens.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case MainScreen.routeName:
        return MainScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case BrowseByCategory.routeName:
        return BrowseByCategory.route();
      // case MatchesScreen.routeName:
      //   return MatchesScreen.route();
      // case ProfileScreen.routeName:
      //   return ProfileScreen.route();
      // case SplashScreen.routeName:
      //   return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      // case ChatScreen.routeName:
      //   return ChatScreen.route(userMatch: settings.arguments as UserMatch);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
