

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/main/presentation/pages/main_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

class AppRoutes {
  static const String splashPage = '/splashPage';
  static const String loginPage = '/loginPage';
  static const String home = '/home';
  static const String mainPage = '/mainPage';


  static GoRouter createRouter(String initialLocation, {GlobalKey<NavigatorState>? navigatorKey}){
    return GoRouter(
        navigatorKey: navigatorKey,
        initialLocation: splashPage,
        routes: [
          GoRoute(
            path: splashPage,
            builder: (context, state) => const SplashPage(),
          ),
          GoRoute(path: loginPage, builder: (context, state) => const LoginPage(),),
          GoRoute(path: mainPage, builder: (context, state) => const MainPage(),),
    ]);
  }
}