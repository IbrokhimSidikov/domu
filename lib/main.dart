import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domu/features/auth/data/auth_manager.dart';
import 'package:domu/features/splash/cubit/splash_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'core/constants/app_theme.dart';
import 'core/router/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRoutes.createRouter(AppRoutes.splashPage);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SplashCubit(AuthManager())),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'DOMU',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            routerConfig: _router,
          ),
        );
      },
    );
  }
}
