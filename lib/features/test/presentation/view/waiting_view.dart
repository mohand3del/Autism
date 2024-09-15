

import 'package:autism/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'widget/wating_view_body.dart';

class WaitingView extends StatelessWidget {
  const WaitingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body:  WaitingViewBody(),
    );
  }
}
