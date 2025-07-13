

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/features/community/presentation/view/widgets/community_view_body.dart';
import 'package:autism/features/community/viewModel/add_reaction_cubit/add_reaction_cubit.dart';
import 'package:autism/features/community/viewModel/delete_reaction_cubit/delete_reaction_cubit.dart';
import 'package:autism/features/community/viewModel/show_all_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) => getIt<ShowAllPostCubit>()..showAllPosts()),
      BlocProvider(create: (BuildContext context) => getIt<AddReactionCubit>()),
      BlocProvider(create: (BuildContext context) => getIt<DeleteReactionCubit>()),
    ],

      child: const Scaffold(
        backgroundColor: AppColors.white,
      //  appBar: CommunityAppBar(),
        body: CommunityViewBody(),
      ),
    );
  }
}
