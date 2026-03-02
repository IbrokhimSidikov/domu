import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/router/app_routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              24.verticalSpace,
              _buildMenuGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.cxFF462E, width: 2),

          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hayirli tong!',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.cxBlack,
                ),
              ),
              4.verticalSpace,
              Text(
                'Jamila Qurbonaliyeva',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.cxFF462E,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCareerCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kariera',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cxBlack,
                  ),
                ),
                8.verticalSpace,
                Text(
                  'Ishdagi rivojlanish bosqichlari',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGray,
                  ),
                ),
                4.verticalSpace,
                Text(
                  "Lavozim pog'onalari",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                '🏆',
                style: TextStyle(fontSize: 32.sp),
              ),
            ),
          ),
          12.horizontalSpace,
          Icon(
            Icons.arrow_forward_ios,
            size: 20.sp,
            color: AppColors.cxBlack,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid() {
    final menuItems = [
      _MenuItem(
        title: 'Profil',
        subtitle: "Ma'lumotlarim",
        iconPath: AppIcons.profileS,
        route: AppRoutes.profilePage,
      ),
      _MenuItem(
        title: "Ta'lim",
        subtitle: 'Darslik va testlar',
        iconPath: AppIcons.education,
        route: AppRoutes.educationPage,
      ),
      _MenuItem(
        title: 'Face ID',
        subtitle: 'Ishga kelish- ketish',
        iconPath: AppIcons.faceId,
        route: AppRoutes.attendancePage,
      ),
      _MenuItem(
        title: 'Topshiriqlar',
        subtitle: 'Cheklist',
        iconPath: AppIcons.tasks,
        route: AppRoutes.tasksPage,
      ),
      _MenuItem(
        title: 'Takliflar',
        subtitle: "Qo'shimcha qiymat",
        iconPath: AppIcons.taklif,
      ),
      _MenuItem(
        title: 'Samaradorlik',
        subtitle: 'Dashboard',
        iconPath: AppIcons.productivity,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1.0,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return GestureDetector(
          onTap: item.route != null ? () => context.push(item.route!) : null,
          child: _buildMenuItem(item),
        );
      },
    );
  }

  Widget _buildMenuItem(_MenuItem item) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                item.iconPath,
                width: 28.w,
                height: 28.w,
              ),
            ),
          ),
          const Spacer(),
          Text(
            item.title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.cxBlack,
            ),
          ),
          4.verticalSpace,
          Text(
            item.subtitle,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGray,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final String subtitle;
  final String iconPath;
  final String? route;

  _MenuItem({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    this.route,
  });
}
