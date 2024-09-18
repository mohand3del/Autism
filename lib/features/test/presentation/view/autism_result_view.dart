
import 'package:autism/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'widget/autism_result_view_body.dart';

class AutismResultView extends StatelessWidget {
  const AutismResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body:  AutismResultViewBody(),
    );
  }
}
