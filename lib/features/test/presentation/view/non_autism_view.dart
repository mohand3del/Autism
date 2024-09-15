

import 'package:autism/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'widget/non_autism_view_body.dart';

class NonAutismView extends StatelessWidget {
  const NonAutismView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body:  NonAutismViewBody(),
    );
  }
}
