import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/shared/app_textfield.dart';
import '../../../../core/utils/phone_input_formatter.dart';
import '../../../main/presentation/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _loginFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _loginFocusNode.unfocus();
          _passwordFocusNode.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all( 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              260.verticalSpace,
              Center(
                  child: Text('Xush kelibsiz',
                    style: TextStyle(
                      color: AppColors.cxBlack,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              93.verticalSpace,
              AppTextField(
                controller: _loginController,
                focusNode: _loginFocusNode,
                keyboardType: TextInputType.text,
                hint: 'Login',
                obscureText: false,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.cxBlack,
                ),
              ),
              22.verticalSpace,
              AppTextField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                keyboardType: TextInputType.text,
                hint: 'Password',
                obscureText: true,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.cxBlack,
                ),
              ),
              63.verticalSpace,
              Center(child: Text('Parolni unutdingizmi?', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, color: AppColors.cxFF462E),)),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cxFF462E,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxWhite,
                    ),
                  ),
                ),
              ),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
