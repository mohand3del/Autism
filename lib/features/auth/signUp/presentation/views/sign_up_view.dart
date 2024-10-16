

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/auth/signUp/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.white,
        body: SignUpViewBody());
  }
}
