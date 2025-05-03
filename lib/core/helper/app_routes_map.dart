import 'package:bookia/core/helper/app_routes.dart';
import 'package:bookia/features/auth/ui/auth_screen.dart';
import 'package:bookia/features/create_account/cubit/create_account_cubit.dart';
import 'package:bookia/features/create_account/ui/create_account_screen.dart';
import 'package:bookia/features/forget_password/ui/forget_password_screen.dart';
import 'package:bookia/features/login/cubit/login_cubit.dart';
import 'package:bookia/features/login/ui/login_screen.dart';
import 'package:bookia/features/page_view/ui/page_view_screen.dart';
import 'package:bookia/features/passwor_changed/ui/password_changed_screen.dart';
import 'package:bookia/features/reset_password/ui/reset_password_screen.dart';
import 'package:bookia/features/test/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutesMap {
  static final Map<String, Widget Function(BuildContext)> routeMap = {
     AppRoutes.loginScreen:
                  (context) => BlocProvider(
                    create: (context) => LoginCubit(),
                    child: const LoginScreen(),
                  ),
              AppRoutes.createAccoutScreen:
                  (context) => BlocProvider(
                    create: (context) => CreateAccountCubit(),
                    child: const CreateAccountScreen(),
                  ),
              AppRoutes.pageViewScreen: (context) => const PageViewScreen(),
              AppRoutes.authScreen:(context)=>const AuthScreen(),
              AppRoutes.testScreen:(context)=>const TestScreen(),
              AppRoutes.resetPasswordScreen:(context)=>const ResetPasswordScreen(),
              AppRoutes.forgetPasswordScreen:(context)=>const ForgetPasswordScreen(),
              AppRoutes.passwordChangedScreen:(context)=>const PasswordChangedScreen(),

  };
}
