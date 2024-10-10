

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/community/presentation/view/widgets/community_view_body.dart';
import 'package:flutter/material.dart';

import 'widgets/community_app_bar.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommunityAppBar(),
      body: CommunityViewBody(),
    );
  }
}
