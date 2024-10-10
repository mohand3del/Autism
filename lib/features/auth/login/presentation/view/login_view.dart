import 'package:autism/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: LoginViewBody(),
    );
  }
}
