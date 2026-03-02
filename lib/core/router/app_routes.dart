

import 'package:domu/features/work-entry/presentation/pages/attendance_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/education/presentation/pages/education_page.dart';
import '../../features/main/presentation/pages/main_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/task/presentation/pages/tasks_page.dart';
import '../../features/work-entry/presentation/pages/attendance_records.dart';
import '../../features/work-entry/presentation/pages/work_entry_page.dart';

class AppRoutes {
  static const String splashPage = '/splashPage';
  static const String loginPage = '/loginPage';
  static const String home = '/home';
  static const String mainPage = '/mainPage';
  static const String profilePage = '/profilePage';
  static const String educationPage = '/educationPage';
  static const String attendancePage = '/attendancePage';
  static const String workEntryPage = '/workEntryPage';
  static const String attendanceRecordsPage = '/attendanceRecordsPage';
  static const String tasksPage = '/tasksPage';


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
          GoRoute(path: profilePage, builder: (context, state) => const ProfilePage(),),
          GoRoute(path: educationPage, builder: (context, state) => const EducationPage(),),
          GoRoute(path: attendancePage, builder: (context, state) => const AttendancePage(),),
          GoRoute(path: workEntryPage, builder: (context, state) => const WorkEntryPage(),),
          GoRoute(path: attendanceRecordsPage, builder: (context, state) => const AttendanceRecords(),),
          GoRoute(path: tasksPage, builder: (context, state) => const TasksPage(),),
    ]);
  }
}