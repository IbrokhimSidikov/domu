import 'package:domu/core/constants/app_icons.dart';
import 'package:domu/core/router/app_routes.dart';
import 'package:domu/features/splash/cubit/splash_cubit.dart';
import 'package:domu/features/splash/cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          authenticated: () {
            context.go(AppRoutes.mainPage);
          },
          unauthenticated: () {
            context.go(AppRoutes.loginPage);
          },
          error: (message) {},
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 74.h,
                    width: 257.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.domuLogoa),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  28.verticalSpace,
                  Text(
                    'Xodimlarni samarli boshqarish ilovasi',
                    style: TextStyle(
                        color: AppColors.textGray,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //TODO spinning loader
                Text(
                  'version 1.0.0',
                  style: TextStyle(
                    color: AppColors.textGray,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.end,
                ),
                84.verticalSpace,
              ],
            )
          ],
        )
      
      ),
    );
  }
}
