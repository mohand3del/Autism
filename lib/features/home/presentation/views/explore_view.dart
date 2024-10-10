

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/home/presentation/views/widgets/exploreList/explore_view_body.dart';
import 'package:flutter/material.dart';


class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      backgroundColor: AppColors.white,
      body: ExploreViewBody(),
    );
  }
}
