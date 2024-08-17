import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/auth/verifyCode/presentation/views/widgets/verify_code_view_body.dart';
import 'package:flutter/material.dart';

class VerifyCodeView extends StatelessWidget {
 final String? email;
 const  VerifyCodeView({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: VerifyCodeViewBody(email: email),
    );
  }
}
