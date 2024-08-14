import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/auth/forgetPass/presentation/views/widgets/forget_view_body.dart';
import 'package:flutter/material.dart';

class ForgetView extends StatelessWidget {
  const ForgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: ForgetViewBody(),
    );
  }
}
