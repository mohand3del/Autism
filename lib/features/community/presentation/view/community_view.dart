

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/features/community/presentation/view/widgets/community_view_body.dart';
import 'package:autism/features/community/viewModel/show_all_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/community_app_bar.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create:(BuildContext context) => getIt<ShowAllPostCubit>()..showAllPosts(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CommunityAppBar(),
        body: CommunityViewBody(),
      ),
    );
  }
}
