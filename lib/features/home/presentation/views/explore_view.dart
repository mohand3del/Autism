

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/home/presentation/views/widgets/exploreList/explore_view_body.dart';
import 'package:flutter/material.dart';

import 'widgets/exploreList/explore_bottom_sheet.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.white,
      body: ExploreViewBody(),
    );
  }
}
