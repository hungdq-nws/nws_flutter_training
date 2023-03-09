import 'package:flutter/material.dart';
import 'package:flutter_training/features/ex_c3/ex_c3.dart';
import 'package:flutter_training/main.dart';

class AppRouter {
  static const String exC3 = 'ExC3';
  static const String home = '/';
  static const String main = 'main';

  static final navigatorKey = GlobalKey<NavigatorState>();
  final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => route(settings),
      settings: RouteSettings(name: settings.name),
    );
  }

  static route(RouteSettings settings) {
    switch (settings.name) {
      case exC3:
        return const ExerciseC3();
      case main:
        return const MyHomePage();
      default:
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
